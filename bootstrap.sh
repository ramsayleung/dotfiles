#!/usr/bin/env bash
## Heavily inspire by spf-13 bootstrap.sh

set -ex

# From https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common_functions.sh
source $DIR/tool_functions.sh

msg             "\nStart to install awesome tool"
# Install awesome programs with built-in package manager/pip/git
source $DIR/install_awesome_tool.sh

