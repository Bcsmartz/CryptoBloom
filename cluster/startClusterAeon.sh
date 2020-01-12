#!/bin/sh

#echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2

# PRE PURGE
rm -f $HOME/Desktop/mine/recordAEONs.log

# AEON
AEON_AD="WmtBH7LDfdhUWjRqKUnAuCBEFnsFujhA6DEhq38apF9NbVmBU3UxsVyCbowcVhSfwXdPH7v5AUcVYWQd5BAHZeMx1q91SkN75"

cd $HOME/Desktop/mine/xmrig/build

DIFF=500

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
#echo $CURR_HOUR

if [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
    # Best
	#echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
    -o aeon.herominers.com:10651 -u $AEON_AD -p $WORKERNAME -a k12 -k \
    -o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
    -o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME -a k12 -k \
    -o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME -a k12 -k \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-t 1 > $HOME/Desktop/mine/recordAEONs.log &
elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	#echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
	-o aeon.herominers.com:10651 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME -a k12 -k \
	-o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME -a k12 -k \
	-o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-t 1 > $HOME/Desktop/mine/recordAEONs.log &
else
    #echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig -a cryptonight-lite --donate-level 1 \
    -o aeon.herominers.com:10651 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o aeon.pool.gntl.co.uk:2222 -u $AEON_AD+$DIFF -p $WORKERNAME -a k12 -k \
	-o pool.aeon.hashvault.pro:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o pool.aeonminingpool.com:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-o aeon.ingest.cryptoknight.cc:5541 -u $AEON_AD.$DIFF -p $WORKERNAME -a k12 -k \
	-o aeon.pooltupi.com:3333 -u $AEON_AD -p $WORKERNAME -a k12 -k \
	-t 1 > $HOME/Desktop/mine/recordAEONs.log &
fi

#tail -f $HOME/Desktop/mine/recordAEONs.log