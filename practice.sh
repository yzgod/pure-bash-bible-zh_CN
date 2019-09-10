#!/usr/local/bin/bash
# bash升级到了5.0
# shellcheck source=/dev/null
#
# Tests for the Pure Bash Bible.

# 执行完毕清空屏幕输出
#trap 'printf \\e[2J\\e[H\\e[m' EXIT
# 忽略终止命令
#trap '' INT

#echo {1..10..3}
#sleep 5s
#echo {01..10}
#sleep 5s
#echo {A..Z}{0..9}

get_term_size() {
    # 用法: get_term_size

    # (:;:) 是一个短暂暂停，以确保变量立即导出
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}
get_term_size

get_window_size() {
    # 用法: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}

get_window_size

get_cursor_pos() {
    # 用法: get_cursor_pos
    IFS='[;' read -p $'\e[6n' -d R -rs _ y x _
    printf '%s\n' "$x $y"
}

get_cursor_pos

