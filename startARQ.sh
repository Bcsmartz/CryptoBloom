#!/bin/sh

echo "$0 $1 $2 $3 $4"

DURATION=$1 #3600
WORKERNAME=$2 # Worker-Bee-Mining

CPU_USE_PERCENT=$3 # 1-100%
CPU_PRI_RANK=$4 # 0 1 2 3

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
#echo $CURR_HOUR
DIFF=350

# ENV SETUP
cd $HOME/Desktop/mine/xmrig/build

# PRE PURGE
rm -rf $HOME/Desktop/mine/recordARQs.log

# ADDRESS
ARQ_AD="ar41hWuB7ePdahum34BkJG8JWjJrRFqim9muTA5CmndHLyCpo6Ja5jGNXoqGHXpYr5gWdux8Nm1q1UiM67XsfC2u32jVR1R1F"

# ARQ
if [ $(( $CURR_HOUR % 1 )) -eq 0 ];          # no need for brackets
then
	#echo "divisible by 3"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o arq.pool.gntl.co.uk:2222 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com -k \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	--cpu-max-threads-hint=$CPU_USE_PERCENT --cpu-priority $CPU_PRI_RANK --randomx-mode=auto \
	--retries=3 > $HOME/Desktop/mine/recordARQs.log & #\ --cpu-memory-pool=1  --threads 1 #--cpu-affinity 15 --threads 1 #--cpu-affinity 15 --randomx-mode=auto \
else
	#echo "not divisible - Default"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o arq.pool.gntl.co.uk:2222 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	--cpu-max-threads-hint=$CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME/Desktop/mine/recordARQs.log &
	
fi

cd $HOME/Desktop/mine/
tail -f $HOME/Desktop/mine/recordARQs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
