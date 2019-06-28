#!/bin/sh

echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2

# PRE PURGE
rm $HOME/Desktop/mine/recordARQs.log

PLE_AD="PLeazPhnC1qXe4Vg4CVoLaFR6vNtkyTvMGoWnRJ8eEP7jTEvFKMyxRf6NMPKisqFo8JDLPT6BuuGoYkQX6xuL74R6svnyi59Su"
ARQ_AD="ar41hWuB7ePdahum34BkJG8JWjJrRFqim9muTA5CmndHLyCpo6Ja5jGNXoqGHXpYr5gWdux8Nm1q1UiM67XsfC2u32jVR1R1F"

cd $HOME/Desktop/mine/xmrig/build

DIFF=350

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR

if [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 3"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o hydra.xripx.com:9692 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} --variant 1 -k \
	-o arq.ingest.cryptoknight.cc:3731 -u $ARQ_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-o arqple.herominers.com:10630 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o arq.pool.gntl.co.uk:2222 -u $ARQ_AD+$DIFF -p $WORKERNAME --variant 1 -k \
	-t 1 > $HOME/Desktop/mine/recordARQs.log 2>&1 &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o arqple.herominers.com:10630 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o hydra.xripx.com:9692 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o arq.pool.gntl.co.uk:2222 -u $ARQ_AD+$DIFF -p $WORKERNAME --variant 1 -k \
	-o arq.ingest.cryptoknight.cc:3731 -u $ARQ_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-t 1 > $HOME/Desktop/mine/recordARQs.log 2>&1 &
else
	echo "not divisible - Default"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o arq.pool.gntl.co.uk:2222 -u $ARQ_AD+$DIFF -p $WORKERNAME --variant 1 -k \
	-o hydra.xripx.com:9692 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o arq.ingest.cryptoknight.cc:3731 -u $ARQ_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-o arqple.herominers.com:10630 -u $ARQ_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-t 1 > $HOME/Desktop/mine/recordARQs.log 2>&1 &
fi

#tail -f $HOME/Desktop/mine/recordARQs.log
