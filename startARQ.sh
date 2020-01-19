#!/bin/sh

echo $1 $2 $3 $4

CPU_USE=$1
CPU_PRI=$2
DURATION=$3 #3600

cd 
HOME_DIR=$(pwd)

# PRE PURGE
rm $HOME_DIR/Desktop/mine/recordARQs.log

ARQ_AD="ar41hWuB7ePdahum34BkJG8JWjJrRFqim9muTA5CmndHLyCpo6Ja5jGNXoqGHXpYr5gWdux8Nm1q1UiM67XsfC2u32jVR1R1F"

#WORKERNAME="Rai-Real-Pi-13"
#WORKERNAME="Rai-13"
WORKERNAME=$4 #"Rai-Black-13"

cd $HOME_DIR/Desktop/mine/xmrig/build

export DIFF=350
export CURR_HOUR=`date +%H`
export CURR_HOUR=`expr $CURR_HOUR + 0`
echo $CURR_HOUR
if [ $(( $CURR_HOUR % 3 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 3"

	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	--cpu-max-threads-hint=#CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME_DIR/Desktop/mine/recordARQs.log 2>&1 & #\ --threads 1 #--cpu-affinity 15  \

elif [ $(( $CURR_HOUR % 2 )) -eq 0 ];          # no need for brackets
then
	echo "divisible by 2"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	--cpu-max-threads-hint=#CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME_DIR/Desktop/mine/recordARQs.log 2>&1 & #\ --threads 1 #--cpu-affinity 15  \
else
	echo "not divisible - Default"
	timeout "${DURATION}s" ./xmrig --donate-level 1 -a rx/arq \
	-o pool.arq.semipool.com:22205 -u $ARQ_AD+$DIFF -p ${WORKERNAME}:bczmarts@gmail.com  -k \
	-o mine.arqma.com:3333 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	-o ca.arqma.herominers.com:10640 -u $ARQ_AD.$DIFF -p ${WORKERNAME} -k \
	--cpu-max-threads-hint=#CPU_USE \
	--cpu-priority $CPU_PRI --cpu-memory-pool=1 --randomx-mode=auto \
	--retries=3 > $HOME_DIR/Desktop/mine/recordARQs.log 2>&1 & #\ --threads 1 #--cpu-affinity 15  \
	
fi

cd $HOME_DIR/Desktop/mine/
tail -f $HOME_DIR/Desktop/mine/recordARQs.log
#tail -f /home/pi/Desktop/mine/recordAEONs.log
