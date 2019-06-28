#!/bin/sh

#echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2

# PRE PURGE
rm -f $HOME/Desktop/mine/recordLOKIs.log

TRTL_AD="TRTLuy38s5nALY1MoWbmoVSRCafuBibusa8mWuGvuKKXSgDidXQjE6RQovWEkjGs7ySLFXZkceykvijVDCgqtxLVcjXmXKQs8YW"
LOKI_AD="LEak4Lxdgw2VBUbnrPJfWpB4grWhrq6gHM5dAD3cqu5vdSM5fgJEeGYED6BmYeD3R6VRTvR3oqzC3foTwoDLjG67TEYth7d"

cd $HOME/Desktop/mine/xmrig/build

DIFF=1000

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
#echo $CURR_HOUR

if [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
    #echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o lokiturtle.herominers.com:10520 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
	-o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	-o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	-t 1 > $HOME/Desktop/mine/recordLOKIs.log &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	#echo "divisible by 2"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o lokiturtle.herominers.com:10520 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
	-o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	-t 1 > $HOME/Desktop/mine/recordLOKIs.log &
else
    #echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
    -o lokiturtle.herominers.com:10520 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	-t 1 > $HOME/Desktop/mine/recordLOKIs.log &
fi

#tail -f $HOME/Desktop/mine/recordLOKIs.log
