#!/bin/sh

#echo $1 $2

DURATION=$1 #3600
WORKERNAME=$2

# PRE PURGE
rm -f $HOME/Desktop/mine/recordARQs.log

PLE_AD="PLeazPhnC1qXe4Vg4CVoLaFR6vNtkyTvMGoWnRJ8eEP7jTEvFKMyxRf6NMPKisqFo8JDLPT6BuuGoYkQX6xuL74R6svnyi59Su"
ARQ_AD="ar41hWuB7ePdahum34BkJG8JWjJrRFqim9muTA5CmndHLyCpo6Ja5jGNXoqGHXpYr5gWdux8Nm1q1UiM67XsfC2u32jVR1R1F"

cd $HOME/Desktop/mine/xmrig/build

DIFF=350

CURR_HOUR=`date +%H`
CURR_HOUR=`expr $CURR_HOUR + 0`
#echo $CURR_HOUR

if [ $(( $CURR_HOUR % 4 )) -eq 0 ];          # no need for brackets
then
	#echo "divisible by 3"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	-t 1 > $HOME/Desktop/mine/recordARQs.log &

	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	--cpu-max-threads-hint=#CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME_DIR/Desktop/mine/recordARQs.log 2>&1 & #\ --threads 1 #--cpu-affinity 15  \
elif [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
	#echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	--cpu-max-threads-hint=#CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME/Desktop/mine/recordARQs.log &
else
	#echo "not divisible - Default"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	--cpu-max-threads-hint=#CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME/Desktop/mine/recordARQs.log &
fi

#tail -f $HOME/Desktop/mine/recordARQs.log
