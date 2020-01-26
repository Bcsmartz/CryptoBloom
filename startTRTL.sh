#!/bin/sh

echo "$0 $1 $2 $3 $4"

DURATION=$1 #3600
WORKERNAME=$2 # Worker-Bee-Mining

CPU_USE_PERCENT=$3 # 1-100%
CPU_PRI_RANK=$4 # 0 1 2 3

# PRE PURGE
rm $HOME/Desktop/mine/recordTRTL.log

TRTL_AD="TRTLuy38s5nALY1MoWbmoVSRCafuBibusa8mWuGvuKKXSgDidXQjE6RQovWEkjGs7ySLFXZkceykvijVDCgqtxLVcjXmXKQs8YW"

cd $HOME/Desktop/mine/xmrig/build

export DIFF=1000
export CURR_HOUR=`date +%H`
export CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR

if [ $(( $CURR_HOUR % 1 )) -eq 0 ];          # no need for brackets
then
    # Loki
    timeout "${DURATION}s" ./xmrig --donate-level 1 -a chukwa \
	-o ca.turtlecoin.herominers.com:10380 -u ${TRTL_AD}.$DIFF -p $WORKERNAME:bczmarts@gmail.com -k \
    --cpu-max-threads-hint=$CPU_USE_PERCENT --cpu-priority $CPU_PRI_RANK \
    --log-file=$HOME/Desktop/mine/recordTRTL.log 2>&1 &

fi

cd $HOME/Desktop/mine/
tail -f $HOME/Desktop/mine/recordTRTL.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
