$ cat edit_tsv.sh
#!/bin/bash

PATH=${HOME}/bin:${PATH}
export $PATH

WORK_DIR="." 
EDIT_NAME="$1" 
WORK_PATH=${WORK_DIR}/${EDIT_NAME}

echo "[Edit ${EDIT_NAME}]" 

# 展開
echo "  transpose ${WORK_PATH}" 
transpose.awk ${WORK_PATH} >${WORK_PATH}.trans

echo "" 
echo "vim ${WORK_PATH}.new" 
echo "------------------------------" 

# 編集

vim ${WORK_PATH}.trans

echo "[Check difference]" 

# 差分確認
transpose.awk ${WORK_PATH} |diff -u - ${WORK_PATH}.trans |nkf

count=0
while [ ! "x${answer2}" = "xy" -a ${count} -lt 2 ]
do

    echo "------------------------------" 
    echo "Check in? [y/N]" 
    read answer2

    case "${answer2}" in
        y)
            # nop
            ;;
        *)
            count=`expr ${count} + 1`
            ;;
    esac

done

case "${answer2}" in
    y)
        # 上書き
        transpose.awk ${WORK_PATH}.trans >${WORK_PATH}
        ;;
    *)
        echo "Exit" 
        [ -e ${WORK_PATH}.trans ] && rm ${WORK_PATH}.trans
        exit 1
        ;;
esac

[ -e ${WORK_PATH}.trans ] && rm ${WORK_PATH}.trans
exit 0

