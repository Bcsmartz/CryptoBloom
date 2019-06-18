#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600

cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordARQs.log

PLE_AD="PLeazPhnC1qXe4Vg4CVoLaFR6vNtkyTvMGoWnRJ8eEP7jTEvFKMyxRf6NMPKisqFo8JDLPT6BuuGoYkQX6xuL74R6svnyi59Su"
ARQ_AD="ar41hWuB7ePdahum34BkJG8JWjJrRFqim9muTA5CmndHLyCpo6Ja5jGNXoqGHXpYr5gWdux8Nm1q1UiM67XsfC2u32jVR1R1F"

#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
WORKERNAME=$4 #"Rai-Black-13"

cd $HOME_DIR/Desktop/mine/xmrig/build

export DIFF=350

if [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o arqple.herominers.com:10630 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o hydra.xripx.com:9692 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o arq.ingest.cryptoknight.cc:3731 -u $ARQ_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordARQs.log 2>&1 &
else
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o hydra.xripx.com:9692 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o arq.ingest.cryptoknight.cc:3731 -u $ARQ_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-o arqple.herominers.com:10630 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordARQs.log 2>&1 &
fi

cd $HOME_DIR/Desktop/mine/
tail -f $HOME_DIR/Desktop/mine/recordARQs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
