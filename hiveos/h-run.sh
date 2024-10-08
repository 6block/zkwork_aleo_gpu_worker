#!/usr/bin/env bash

[[ `ps aux | grep "aleo_prover --address" | grep -v grep | wc -l` != 0 ]] && echo  "/hive/miners/custom/aleo_prover is already running" && exit 1

cd `dirname $0`

[ -t 1 ] && . colors

. aleo_prover.conf

echo "ADDRESS = "$ADDRESS
echo "POOL = "$POOL
echo "WORKER_NAME = "$WORKER_NAME
echo "CUSTOM_USER_CONFIG = "$CUSTOM_USER_CONFIG

echo "CUSTOM_NAME = "$CUSTOM_NAME
echo "CUSTOM_VERSION = "$CUSTOM_VERSION
echo "CUSTOM_LOG_BASEDIR = "$CUSTOM_LOG_BASEDIR
echo "CUSTOM_LOG_BASENAME = "$CUSTOM_LOG_BASENAME
echo "CUSTOM_CONFIG_FILENAME = "$CUSTOM_CONFIG_FILENAME


[[ -z $CUSTOM_LOG_BASENAME ]] && echo -e "${RED}No CUSTOM_LOG_BASENAME is set${NOCOLOR}" && exit 1
[[ -z $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}No CUSTOM_CONFIG_FILENAME is set${NOCOLOR}" && exit 1
[[ ! -f $CUSTOM_CONFIG_FILENAME ]] && echo -e "${RED}Custom config ${YELLOW}$CUSTOM_CONFIG_FILENAME${RED} is not found${NOCOLOR}" && exit 1

[[ ! -d $CUSTOM_LOG_BASEDIR ]] && mkdir -p $CUSTOM_LOG_BASEDIR

POOLS=""

for i in $POOL; do
    POOLS+="--pool $i "
done

if gpu-detect list; then
    echo "GPU Detected"
    ./aleo_prover --address $ADDRESS $POOLS --custom_name $WORKER_NAME $CUSTOM_USER_CONFIG 2>&1 | tee ${CUSTOM_LOG_BASENAME}.log
fi
