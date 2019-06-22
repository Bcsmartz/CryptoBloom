#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600

cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordLOKIs.log

TRTL_AD="TRTLuy38s5nALY1MoWbmoVSRCafuBibusa8mWuGvuKKXSgDidXQjE6RQovWEkjGs7ySLFXZkceykvijVDCgqtxLVcjXmXKQs8YW"
LOKI_AD="LEak4Lxdgw2VBUbnrPJfWpB4grWhrq6gHM5dAD3cqu5vdSM5fgJEeGYED6BmYeD3R6VRTvR3oqzC3foTwoDLjG67TEYth7d"
PLE_AD="PLeazPhnC1qXe4Vg4CVoLaFR6vNtkyTvMGoWnRJ8eEP7jTEvFKMyxRf6NMPKisqFo8JDLPT6BuuGoYkQX6xuL74R6svnyi59Su"

#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
WORKERNAME=$4 #"Rai-Black-13"

cd $HOME_DIR/Desktop/mine/xmrig/build
export DIFF=1000
export CURR_HOUR=`date +%H`
export CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR
if [ $(( $CURR_HOUR % 5 )) -eq 0 ];          # no need for brackets
then
    echo "divisible by 5"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o lokiturtle.herominers.com:10521 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
    -o plenteum.herominers.com:10431 -u $LOKI_AD.${DIFF} -p $PLE_AD@${WORKERNAME} --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
    -o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
    -o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
    --max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordLOKIs.log 2>&1 &
elif [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
    echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o lokiturtle.herominers.com:10521 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
    -o plenteum.herominers.com:10431 -u $LOKI_AD.${DIFF} -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	-o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordLOKIs.log 2>&1 &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 2"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o plenteum.herominers.com:10431 -u $LOKI_AD.${DIFF} -p $PLE_AD@${WORKERNAME} --variant 1 -k \
    -o lokiturtle.herominers.com:10521 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
	-o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordLOKIs.log 2>&1 &
else
    echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
    -o plenteum.herominers.com:10431 -u $LOKI_AD.${DIFF} -p $PLE_AD@${WORKERNAME} --variant 1 -k \
    -o lokiturtle.herominers.com:10521 -u $LOKI_AD.${DIFF} -p $TRTL_AD@${WORKERNAME} --variant 1 -k \
    -o trtl.cnpool.cc:32516 -u $TRTL_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o loki.cnpool.cc:23333 -u $LOKI_AD.${DIFF}@${WORKERNAME} -p $TRTL_AD --variant 1 -k \
    -o pool.loki.hashvault.pro:3333 -u $LOKI_AD:$TRTL_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o ca.loki.miner.rocks:4005 -u $LOKI_AD -p w=$WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordLOKIs.log 2>&1 &
fi

cd $HOME_DIR/Desktop/mine/
tail -f $HOME_DIR/Desktop/mine/recordLOKIs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
