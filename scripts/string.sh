#!/usr/local/bin/bash
# bash升级到了5.0
# shellcheck source=/dev/null
#
# Tests for the Pure Bash Bible.

trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}



#str0="    yy gg  "
#trim_string "$str0"
#trim_all "$str0"


regex() {
    # Usage: regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}

#regex "#FFFFFF" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'


split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}

#ss=($(split "apples,oranges,pears,grapes" ","))
#echo ${ss[1]}


#CAVEAT: Requires bash 4+
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}

#lower "HELLO1"

#CAVEAT: Requires bash 4+
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}

#upper "hello"


#CAVEAT: Requires bash 4+
reverse_case() {
    # Usage: reverse_case "string"
    printf '%s\n' "{1~~}"
}
#reverse_case "hEllo"

trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}

#var="'Hello', \"World\""
#trim_quotes "$var"

# delete the regex first occur
strip() {
    # Usage: strip "string" "pattern"
    printf '%s\n' "${1/$2}"
}

lstrip() {
    # Usage: lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}

rstrip() {
    # Usage: rstrip "string" "pattern"
    printf '%s\n' "${1%%$2}"
}
#lstrip "gfgfgfg" "g"
#rstrip "gfgfgfg" "g"

# delete the regex all
strip_all() {
    # Usage: strip_all "string" "pattern"
    printf '%s\n' "${1//$2}"
}
#strip_all "The Quick Brown Fox" "[aeiou]"
#strip_all "The Quick Brown Fox" "[[:space:]]"

urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}
#urlencode "https://github.com/dylanaraps/pure-bash-bible?"

urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}

uuid() {
    # 用法: uuid
    C="89ab"

    for ((N=0;N<16;++N)); do
        B="$((RANDOM%256))"

        case "$N" in
            6)  printf '4%x' "$((B%16))" ;;
            8)  printf '%c%x' "${C:$RANDOM%${#C}:1}" "$((B%16))" ;;
            3|5|7|9)
                printf '%02x-' "$B"
            ;;
            *)
                printf '%02x' "$B"
            ;;
        esac
    done
    printf '\n'
}
#uuid


