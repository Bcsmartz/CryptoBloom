#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600


cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordXMRs.log

MONERO_AD="4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWAMrNRyfdJCPB25AaD"

#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
WORKERNAME=$4 #"Rai-Black-13"

cd $HOME_DIR/Desktop/mine/xmrig/build

export CURR_HOUR=`date +%H`
echo $CURR_HOUR
if [ $(( $CURR_HOUR % 5 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 5"
    timeout "${DURATION}s" ./xmrig --donate-level 1 \
    -o pool.supportxmr.com:5555 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o monero.ingest.cryptoknight.cc:4441 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o monero.herominers.com:10190 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o pool.hashvault.pro:3333 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o xmr.coinfoundry.org:3032 -u ${MONERO_AD}.$WORKERNAME -p x --variant 1 -k \
	-o xmr-us.dwarfpool.com:8005 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o xmr.pool.minergate.com:45700 -u bczmarts@gmail.com -p x --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXMRs.log 2>&1 &
elif [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
    echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig --donate-level 1 \
	-o monero.ingest.cryptoknight.cc:4441 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o monero.herominers.com:10190 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o pool.hashvault.pro:3333 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.supportxmr.com:5555 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o xmr.coinfoundry.org:3032 -u ${MONERO_AD}.$WORKERNAME -p x --variant 1 -k \
	-o xmr-us.dwarfpool.com:8005 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o xmr.pool.minergate.com:45700 -u bczmarts@gmail.com -p x --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXMRs.log 2>&1 &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 2"
    timeout "${DURATION}s" ./xmrig --donate-level 1 \
	-o monero.herominers.com:10190 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o pool.hashvault.pro:3333 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.supportxmr.com:5555 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o monero.ingest.cryptoknight.cc:4441 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o xmr.coinfoundry.org:3032 -u ${MONERO_AD}.$WORKERNAME -p x --variant 1 -k \
	-o xmr-us.dwarfpool.com:8005 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o xmr.pool.minergate.com:45700 -u bczmarts@gmail.com -p x --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXMRs.log 2>&1 &
else
    echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig --donate-level 1 \
    -o pool.hashvault.pro:3333 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
    -o pool.supportxmr.com:5555 -u $MONERO_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o monero.ingest.cryptoknight.cc:4441 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o monero.herominers.com:10190 -u $MONERO_AD -p $WORKERNAME--variant 1 -k \
	-o xmr.coinfoundry.org:3032 -u ${MONERO_AD}.$WORKERNAME -p x --variant 1 -k \
	-o xmr-us.dwarfpool.com:8005 -u $MONERO_AD -p $WORKERNAME --variant 1 -k \
	-o xmr.pool.minergate.com:45700 -u bczmarts@gmail.com -p x --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI > $HOME_DIR/Desktop/mine/recordXMRs.log 2>&1 &
fi

cd $HOME_DIR/Desktop/mine/
tail -f $HOME_DIR/Desktop/mine/recordXMRs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log