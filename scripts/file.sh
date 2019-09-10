#!/usr/local/bin/bash
# bash升级到了5.0
# shellcheck source=/dev/null
#
# Tests for the Pure Bash Bible.

lines_loop() {
    # Usage: lines_loop "file"
    count=0
    while IFS= read -r _; do
        ((count++))
    done < "$1"
    printf '%s\n' "$count"
}
#lines_loop ~/.bash_profile

dirname() {
    # 用法: dirname "path"
    printf '%s\n' "${1%/*}/"
}

#dirname ./build.sh

basename() {
    # Usage: basename "path"
    : "${1%/}"
    printf '%s\n' "${_##*/}"
}
#basename ~/Pictures/Wallpapers/1.jpg


