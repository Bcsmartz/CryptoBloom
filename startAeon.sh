#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600

cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordAEONs.log
#rm $HOME_DIR/Desktop/mine/recordXMRs.log

#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
#WORKERNAME="Rai-Black-13"
WORKERNAME=$4 #"Rai-Homew-13"

# AEON
AEON_AD="WmtBH7LDfdhUWjRqKUnAuCBEFnsFujhA6DEhq38apF9NbVmBU3UxsVyCbowcVhSfwXdPH7v5AUcVYWQd5BAHZeMx1q91SkN75"

cd $HOME_DIR/Desktop/mine/xmrig/build

export DIFF=500
export CURR_HOUR=`date +%H`
export CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR

if [ $(( $CURR_HOUR % 5 )) -eq 0 ];          # no need for brackets
then
    # Best
	echo "divisible by 5"
    timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
    -o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME --variant 1 -k \
    -o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	-o pool.semipool.com:22287 -u $ARMS_AD+$DIFF -p $AEON_AD-${WORKERNAME} --variant 1 -k \
	-o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordAEONs.log 2>&1 &
elif [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
	-o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
    -o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordAEONs.log 2>&1 &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	-o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordAEONs.log 2>&1 &
else
    echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
	-o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME:bczmarts@gmail.com --variant 1 -k \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	-o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME --variant 1 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordAEONs.log 2>&1 &
fi

cd $HOME_DIR/Desktop/mine/
#tail -f $HOME_DIR/Desktop/mine/recordXMRs.log
tail -f $HOME_DIR/Desktop/mine/recordAEONs.log