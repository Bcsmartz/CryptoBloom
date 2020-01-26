#!/bin/sh

echo $1 $2 $3 $4

#echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2 # Worker-Bee-Mining

CPU_USE_PERCENT=$3 # 1-100%
CPU_PRI_RANK=$4 # 0 1 2 3

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
#echo $CURR_HOUR

# PRE PURGE
rm -rf $HOME/Desktop/mine/recordXTNCs.log

# x-cash
XTNC_AD="XCA1raAoXoG3PemiekrEqrcGd9XDezvBW38TGywZxYMPfRfFj1MNzwHHAnWrsn4523dbNVRfS1Xh8YqrCrDo4tBp6c3hEchztx"

DIFF=350

cd $HOME/Desktop/mine/xmrig/build

if [ $(( $CURR_HOUR % 1 )) -eq 0 ];          # no need for brackets
then
	# Best
	echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig --donate-level 1 \
	-o xcash.herominers.com:10490 -u ${XTNC_AD}.${DIFF} -p ${WORKERNAME}:bczmarts@gmail.com -a cn/double -k \
	--cpu-max-threads-hint=$CPU_USE_PERCENT --cpu-priority $CPU_PRI_RANK \
	> $HOME/Desktop/mine/recordXTNCs.log &
else
	# Best
	echo "not divisible - Default"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o hydra.xripx.com:8692 -u $XTNC_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o xtncple.herominers.com:10620 -u $XTNC_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD.${DIFF}@${WORKERNAME} -p $PLE_AD --variant 1 -k \
	-o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p ${WORKERNAME}:bczmarts@gmail.com -k \
	-t 1 > $HOME/Desktop/mine/recordXTNCs.log &
fi	

cd $$HOME/Desktop/mine/
tail -f $$HOME/Desktop/mine/recordXTNCs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
