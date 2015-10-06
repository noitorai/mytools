#!/bin/bash
#
# 各サーバに対して、ssh接続してコマンドを実行する
#

. ${HOME}/conf/myfunctions

SED=`which sed`
SSH=`which ssh`

print_usage () {
    cat <<EOF >&2
usage: $0 [-t] <FILE> [command]
EOF
}

while getopts "t" OPT; do
    case ${OPT} in
    t) OPT_T=true;;
    *) print_usage; exit 1 ;;
    esac
done

shift $(( ${OPTIND} - 1 ))

if [ "x${OPT_T}" = "xtrue" ]; then
    OPT="-t"
else
    OPT=
fi

if [ $# -eq 1 ]; then
    CMD=
elif [ $# -eq 2 ]; then
    CMD="$2"
else
    print_usage
    exit 1
fi


# while read LINE
for LINE in `remove_comment $1`
do
    echo "[connect to ${LINE}]"

    ${SSH} -o "ConnectTimeout=5" ${OPT} ${LINE} ${CMD}
    if [ $? -eq 0 ]; then
        echo -n "[OK : "
    else
        echo -n "[NG : "
    fi
    echo "${LINE}]"
    echo "--------------------------------------"

# TODO: degug mode
# TODO: Output NG lists.
done
