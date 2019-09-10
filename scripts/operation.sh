#!/usr/local/bin/bash
# bash升级到了5.0
# shellcheck source=/dev/null
#
# Tests for the Pure Bash Bible.
bkr() {
    (nohup "$@" &>/dev/null &)
}
#bkr ./bar.sh




