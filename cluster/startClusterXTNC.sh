#!/bin/sh

echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordXTNCs.log

XTNC_AD="XtazhWGcozBXaVZGUochAm4VcJgpvLR8hVLJE9EY9VzwBgoWpNhV1GDYbwUthao444C4SKDYi2KR324a84MzgjiKScaBa9viZu5"
PLE_AD="PLeazPhnC1qXe4Vg4CVoLaFR6vNtkyTvMGoWnRJ8eEP7jTEvFKMyxRf6NMPKisqFo8JDLPT6BuuGoYkQX6xuL74R6svnyi59Su"
TRTL_AD="TRTLuy38s5nALY1MoWbmoVSRCafuBibusa8mWuGvuKKXSgDidXQjE6RQovWEkjGs7ySLFXZkceykvijVDCgqtxLVcjXmXKQs8YW"

cd $HOME_DIR/Desktop/mine/xmrig/build

DIFF=350

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR

if [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	# Best
	echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o xtncple.herominers.com:10620 -u $XTNC_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o hydra.xripx.com:8692 -u $XTNC_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD.${DIFF}@${WORKERNAME} -p $PLE_AD --variant 1 -k \
	-o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p ${WORKERNAME}:bczmarts@gmail.com -k \
	-t 1 > $HOME_DIR/Desktop/mine/recordXTNCs.log 2>&1 &
else
	# Best
	echo "not divisible - Default"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o hydra.xripx.com:8692 -u $XTNC_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o xtncple.herominers.com:10620 -u $XTNC_AD.$DIFF -p $PLE_AD@${WORKERNAME} --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD.${DIFF}@${WORKERNAME} -p $PLE_AD --variant 1 -k \
	-o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p ${WORKERNAME}:bczmarts@gmail.com -k \
	-t 1 > $HOME_DIR/Desktop/mine/recordXTNCs.log 2>&1 &
fi

#tail -f $HOME_DIR/Desktop/mine/recordXTNCs.log
