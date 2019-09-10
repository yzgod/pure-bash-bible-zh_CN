#!/usr/local/bin/bash
# bash升级到了5.0
# shellcheck source=/dev/null
#
# Tests for the Pure Bash Bible.
bar() {
    # 用法: bar 1 10
    #           ^----- 已经完成的百分比 (0-100).
    #             ^--- 字符总长度.
    ((elapsed=$1*$2/100))
    # 创建空格表示的进度条
    printf -v prog  "%${elapsed}s"
    printf -v total "%$(($2-elapsed))s"
    printf '%s\r' "[ ${elapsed}% ${prog// /-}${total} ]"
}

# 进度条使用
for ((i=i;i<=30;i++)); do
    # 纯粹的暂停动作 (为了本例可以更好的演示).
    sleep 0.1s
    # Print the bar.
    ((percent=$i*100/30))
    bar "$percent" "100"

    if [[ $i = 30 ]]; then
        printf '\n'
    fi
done


