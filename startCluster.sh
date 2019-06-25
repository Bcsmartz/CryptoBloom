#!/bin/sh
#
#28 * * * * sh $HOME/Desktop/mine/CryptoBloom/startCluster.sh 56 1 500 Rai-Cluster aeon

echo "$0 cpu_usage cpu_priority timeout_duration worker_name crypto_id"
echo $0 $1 $2 $3 $4 $5

export CPU_USE=$1
export CPU_PRI=$2
export DURATION=$3 #3600
export WORKERNAME=$4 #"Rai-Homew-13"
#export CRYPTOMINE=$5 #ticker
export CRYPTOMINE=$(echo $5 | tr a-z A-Z)

if [[ "$CRYPTOMINE" = "AEON" ]]; then
    export CRYPTOMINE='startAeon.sh'

elif [[ "$CRYPTOMINE" = "XMR" ]]; then
    export CRYPTOMINE='startXmr.sh'

elif [[ "$CRYPTOMINE" = "LOKI" ]]; then
	export CRYPTOMINE='startLoki.sh'

elif [[ "$CRYPTOMINE" = "XTNC" ]]; then
    export CRYPTOMINE='startXTNC.sh'

elif [[ "$CRYPTOMINE" = "ARQ" ]]; then
    export CRYPTOMINE='startARQ.sh'

elif [[ "$CRYPTOMINE" = "XSC" ]]; then
	export CRYPTOMINE='startXSC.sh'

else
	echo "No ticker match for... $CRYPTOMINE"
	exit 1
fi

NODES=2

mpiexec -f $HOME/Deskop/machinefile -n $NODES python $HOME/Desktop/mine/CryptoBloom/startCluster.py

exit 0
