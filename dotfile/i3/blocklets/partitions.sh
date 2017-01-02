#!/bin/sh

case $BLOCK_BUTTON in
  2)df -h | grep /dev/sda1 | awk '{print $3,$2,$5}' ;;
  3)df -h | grep /dev/sdb1 | awk '{print $3,$2,$5}' ;;
  1)df -h | grep /dev/sda2 | awk '{print $3,$2,$5}' ;;

esac

df -h | grep /dev/sda2 | awk '{print $3,$2,$5}'