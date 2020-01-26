#!/bin/sh

echo "$0 $1 $2 $3 $4"

DURATION=$1 #3600
WORKERNAME=$2 # Worker-Bee-Mining

CPU_USE_PERCENT=$3 # 1-100%
CPU_PRI_RANK=$4 # 0 1 2 3

# PRE PURGE
rm $HOME/Desktop/mine/recordLOKIs.log

LOKI_AD="LEak4Lxdgw2VBUbnrPJfWpB4grWhrq6gHM5dAD3cqu5vdSM5fgJEeGYED6BmYeD3R6VRTvR3oqzC3foTwoDLjG67TEYth7d"

#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"

cd $HOME/Desktop/mine/xmrig/build

export DIFF=1000
export CURR_HOUR=`date +%H`
export CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR

if [ $(( $CURR_HOUR % 1 )) -eq 0 ];          # no need for brackets
then
    # Loki
    timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/loki \
    -o ca.loki.herominers.com:10110 -u ${LOKI_AD}.$DIFF -p $WORKERNAME:bczmarts@gmail.com -k \
    -o loki.cnpool.cc:25333 -u ${LOKI_AD}.$DIFF -p $WORKERNAME -k \
    --cpu-max-threads-hint=$CPU_USE_PERCENT --cpu-priority $CPU_PRI_RANK \
    --log-file=$HOME/Desktop/mine/recordLOKIs.log 2>&1 &

fi

cd $HOME/Desktop/mine/
tail -f $HOME/Desktop/mine/recordLOKIs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
