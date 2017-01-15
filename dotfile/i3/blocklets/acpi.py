#!/usr/bin/python
# -*- coding: utf-8 -*-
# ACPI script
# Copyright (C) 2008  Salvo "LtWorf" Tomaselli
#
# this is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# author Salvo "LtWorf" Tomaselli <tiposchi@tiscali.it>

import os
import signal
import socket
import sys
from subprocess import call
from time import sleep

import dbus

_session_bus = dbus.SessionBus()

_dbus_power = _session_bus.get_object('org.freedesktop.PowerManagement',
                                      '/org/freedesktop/PowerManagement')
_s2ram = _dbus_power.get_dbus_method('Suspend',
                                     'org.freedesktop.PowerManagement')
_s2disk = _dbus_power.get_dbus_method('Hibernate',
                                      'org.freedesktop.PowerManagement')

_dbus_screensaver = _session_bus.get_object('org.freedesktop.ScreenSaver',
                                            '/ScreenSaver')
_lock = _dbus_screensaver.get_dbus_method('Lock',
                                          'org.freedesktop.ScreenSaver')
_simulate_activity = _dbus_screensaver.get_dbus_method(
    'SimulateUserActivity', 'org.freedesktop.ScreenSaver')


def get_cpus():
    '''Returns a list of CPU ids'''
    f = open('/sys/devices/system/cpu/present')
    freq = f.read(4096)
    f.close()
    freq = freq.strip().split('-')
    return range(int(freq[0]), int(freq[1]) + 1)


def get_frequencies(cpu=0):
    '''Returns a list of available frequencies for the selectec CPU. Usually
    it can be assumed that all the CPUs are the same.

    Frequencies are indicated in Mhz

    If not specified the list is about CPU 0'''
    try:
        f = open(
            '/sys/devices/system/cpu/cpu%d/cpufreq/scaling_available_frequencies'
            % cpu)
        freq = f.read(4096)
        f.close()
        freq = freq.strip().split(' ')

        return [int(i) / 1000 for i in freq]
    except:
        maxf = open('/sys/devices/system/cpu/cpu%d/cpufreq/cpuinfo_max_freq' %
                    cpu)
        minf = open('/sys/devices/system/cpu/cpu%d/cpufreq/cpuinfo_min_freq' %
                    cpu)

        mx = int(maxf.readline()) / 1000
        mn = int(minf.readline()) / 1000

        maxf.close()
        minf.close()

        return [mx, mn]


def get_governors(cpu=0):
    '''Returns a list of frequency governors available for a CPU'''
    f = open(
        '/sys/devices/system/cpu/cpu%d/cpufreq/scaling_available_governors' %
        cpu)
    freq = f.read(4096)
    f.close()
    return freq.strip().split(' ')


def is_plugged():
    '''Returns True if the power is plugged and False otherwise.
    On systems where the information is not available, it will raise an
    exception'''
    f = open('/sys/bus/acpi/drivers/ac/ACPI0003:00/power_supply/ADP1/online')
    if f.read(1) == '0':
        res = False
    else:
        res = True

    f.close()
    return res


def daemonize():
    if os.fork() != 0:
        sys.exit(0)
    #For some VERY VERY odd reason, kde will crash on login (resulting in logout) if that sleep is not there
    sleep(30)
    signal.signal(signal.SIGHUP, signal.SIG_IGN)


def _nothing(*a):
    pass


def _call_event(event):
    if isinstance(event, list):
        for i in event:
            i()
    else:
        event()


class listener:
    '''This class listens to acpi events and
    generates events accordingly.

    To receive the events, replace the
    plugged,unplugged and so on variables

    they can be a single function or a list
    of functions'''

    def __init__(self, threaded=False, acpi_socket='/var/run/acpid.socket'):
        #TODO what if threaded = True?

        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.connect(acpi_socket)
        self.s = s

        #Events
        self.plugged = _nothing
        self.unplugged = _nothing
        self.power_button = _nothing
        self.lid_open = _nothing
        self.lid_close = _nothing
        self.raw_event = _nothing

    def plugged_hook(self):
        '''Checks if plugged or not and
        calls the plugged or unplugged hooks.

        This function is very useful at startup or
        after a wakeup when the plugged/unplugged
        event will not be generated automatically.
        '''
        if is_plugged():
            self.plugged()
        else:
            self.unplugged()

    def listen(self):
        '''Starts listening to the ACPI events'''
        while 1:
            for event in self.s.recv(4096).split('\n'):
                event = event.split(' ')
                if len(event) < 2: continue
                self.raw_event(event)
                if event[0] == 'ac_adapter':
                    if event[3] == '00000001':
                        self.plugged()
                    else:
                        self.unplugged()
                elif event[0] == 'button/power':
                    self.power_button()
                elif event[0] == 'button/lid':
                    if event[2] == 'open':
                        self.lid_open()
                    elif event[2] == 'close':
                        self.lid_close()


def powersave_cpu(handler, minf, maxf, cpu):

    for i in cpu:
        call(('sudo', 'cpufreq-set', '-g%s' % handler, '-c%d' % i))
        print('sudo', 'cpufreq-set', '-g%s' % handler, '-c%d' % i)
        call(('sudo', 'cpufreq-set', '-u%dMhz' % maxf, '-d%dMhz' % minf, '-c%d'
              % i))
        print('sudo', 'cpufreq-set', '-u%dMhz' % maxf, '-d%dMhz' % minf, '-c%d'
              % i)


def lock_screen():
    '''Uses dbus to lock the screen'''
    return _lock()


def screen_off():
    #TODO maybe do it with a different method
    call(('xset', 'dpms', 'force', 'off'))


def simulate_user_activity():
    '''Simulates some activity to stop the screensaver from triggering'''
    _simulate_activity()


def s2ram():
    '''Uses dbus to suspend to RAM'''
    return _s2ram()


def s2disk():
    return _s2disk()


##############################################################


def main():
    def plugged():
        freqs = get_frequencies()
        powersave_cpu('ondemand', min(freqs), max(freqs), get_cpus())

    def unplugged():
        freqs = get_frequencies()
        powersave_cpu('ondemand', min(freqs), min(freqs), get_cpus())

    def lid_close():
        lock_screen()
        s2ram()
        l.plugged_hook()

    def power_button():
        lock_screen()
        if not is_plugged():
            s2ram()
            l.plugged_hook()
        else:
            screen_off()

    def ev(e):
        print e

    daemonize()

    l = listener()
    print "Connected to acpid"
    l.plugged = plugged
    l.unplugged = unplugged
    l.lid_close = lid_close
    l.power_button = power_button
    l.raw_event = ev

    l.plugged_hook()
    l.listen()


if __name__ == '__main__':
    main()
