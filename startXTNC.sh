#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600

cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordXTNCs.log

XTNC_AD="XtazhWGcozBXaVZGUochAm4VcJgpvLR8hVLJE9EY9VzwBgoWpNhV1GDYbwUthao444C4SKDYi2KR324a84MzgjiKScaBa9viZu5"
PLE_AD="PLeazPhnC1qXe4Vg4CVoLaFR6vNtkyTvMGoWnRJ8eEP7jTEvFKMyxRf6NMPKisqFo8JDLPT6BuuGoYkQX6xuL74R6svnyi59Su"
TRTL_AD="TRTLuy38s5nALY1MoWbmoVSRCafuBibusa8mWuGvuKKXSgDidXQjE6RQovWEkjGs7ySLFXZkceykvijVDCgqtxLVcjXmXKQs8YW"


#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
WORKERNAME=$4 #"Rai-Black-13"

cd $HOME_DIR/Desktop/mine/xmrig/build

export CURR_HOUR=`date +%H`
echo $CURR_HOUR
if [ $(( $CURR_HOUR % 5 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 5"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o hydra.xripx.com:8692 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o xtncple.herominers.com:10620 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p XNT-13:bczmarts@gmail.com -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXTNCs.log 2>&1 &
elif [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
    echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p XNT-13:bczmarts@gmail.com -k \
	-o xtncple.herominers.com:10620 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o hydra.xripx.com:8692 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXTNCs.log 2>&1 &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o xtncple.herominers.com:10620 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p XNT-13:bczmarts@gmail.com -k \
	-o hydra.xripx.com:8692 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXTNCs.log 2>&1 &
else
    echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o hydra.xripx.com:8692 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o xtncple.herominers.com:10620 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o xtnc.cnpool.cc:32673 -u $XTNC_AD -p $PLE_AD --variant 1 -k \
	-o pool.xtendcash.hashvault.pro:3333 -u $XTNC_AD:$TRTL_AD -p XNT-13:bczmarts@gmail.com -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXTNCs.log 2>&1 &
fi

cd $HOME_DIR/Desktop/mine/
tail -f $HOME_DIR/Desktop/mine/recordXTNCs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
