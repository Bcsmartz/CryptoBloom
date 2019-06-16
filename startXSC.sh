#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600

cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordXSCs.log

OBSCURE_AD="XSC1UJmkHsP5HrRwbFhHvaaycW2Vz7Fo2BsxjydSicj1FbFmFXS4VQV4YrmaZuhgQZSbfqZzxc1NL6AXjBpnn6Rf25uRv5t2bV"
XTNC_AD="XtazhWGcozBXaVZGUochAm4VcJgpvLR8hVLJE9EY9VzwBgoWpNhV1GDYbwUthao444C4SKDYi2KR324a84MzgjiKScaBa9viZu5"
LOKI_AD="LEak4Lxdgw2VBUbnrPJfWpB4grWhrq6gHM5dAD3cqu5vdSM5fgJEeGYED6BmYeD3R6VRTvR3oqzC3foTwoDLjG67TEYth7d"


#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
WORKERNAME=$4 #"Rai-Black-13"

cd $HOME_DIR/Desktop/mine/xmrig/build

#-o xsc.luckypool.io:8866 -u $OBSCURE_AD -p obscure-$WORKERNAME --variant 1 -k \

export DIFF=210
export CURR_HOUR=`date +%H`
export CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR
if [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 3"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
	-o xsc.cnpool.cc:32590 -u $OBSCURE_AD.${DIFF}@${WORKERNAME} -p $XTNC_AD --variant 1 -k \
	-o obscure.herominers.com:10480 -u $OBSCURE_AD.$DIFF -p obscure-$WORKERNAME --variant 1 -k \
	-o xsc.cnpool.cc:32593 -u $OBSCURE_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordXSCs.log 2>&1 &
else
    echo "not divisible - Default"
    timeout "${DURATION}s" ./xmrig -a cryptonight-pico --donate-level 1 \
    -o obscure.herominers.com:10480 -u $OBSCURE_AD.$DIFF -p obscure-$WORKERNAME --variant 1 -k \
    -o xsc.cnpool.cc:32593 -u $OBSCURE_AD.${DIFF}@${WORKERNAME} -p $LOKI_AD --variant 1 -k \
    -o xsc.cnpool.cc:32590 -u $OBSCURE_AD.${DIFF}@${WORKERNAME} -p $XTNC_AD --variant 1 -k \
	--max-cpu-usage $CPU_USE --cpu-priority $CPU_PRI -t $CPU_PRI > $HOME_DIR/Desktop/mine/recordXSCs.log 2>&1 &
fi

cd $HOME_DIR/Desktop/mine/
tail -f $HOME_DIR/Desktop/mine/recordXSCs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
