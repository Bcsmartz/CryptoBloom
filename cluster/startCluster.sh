#!/bin/bash

#7 * * * * bash $HOME/Desktop/mine/CryptoBloom/startCluster.sh 49 2 3000 Rai-Cluster aeon >/dev/null 2>&1
#13 * * * * bash $HOME/Desktop/mine/CryptoBloom/startCluster.sh 21 1 3000 Rai-Cluster xsc >/dev/null 2>&1
#21 * * * * bash $HOME/Desktop/mine/CryptoBloom/startCluster.sh 21 1 3000 Rai-Cluster xtnc >/dev/null 2>&1
#55 * * * * bash $HOME/Desktop/mine/CryptoBloom/startCluster.sh 49 2 3000 Rai-Cluster arq >/dev/null 2>&1

echo "$0 thread_count timeout_duration worker_name crypto_id"
echo $0 $1 $2 $3 $4

export NODES=$1
export DURATION=$2 #3600
export WORKERNAME=$3
export CRYPTOMINE=$(echo $4 | tr a-z A-Z)

echo $CRYPTOMINE

if [[ "$CRYPTOMINE" = "AEON" ]]; then
    export CRYPTOMINE='startClusterAeon.sh'
    export CRYPTOLOG='recordAEONs.log'

elif [[ "$CRYPTOMINE" = "XMR" ]]; then
    export CRYPTOMINE='startClusterXmr.sh'
    export CRYPTOLOG='recordXMRs.log'

elif [[ "$CRYPTOMINE" = "LOKI" ]]; then
	export CRYPTOMINE='startClusterLoki.sh'
	export CRYPTOLOG='recordLOKIs.log'

elif [[ "$CRYPTOMINE" = "XTNC" ]]; then
    export CRYPTOMINE='startClusterXTNC.sh'
    export CRYPTOLOG='recordXTNCs.log'

elif [[ "$CRYPTOMINE" = "ARQ" ]]; then
    export CRYPTOMINE='startClusterARQ.sh'
    export CRYPTOLOG='recordARQs.log'

elif [[ "$CRYPTOMINE" = "XSC" ]]; then
	export CRYPTOMINE='startClusterXSC.sh'
	export CRYPTOLOG='recordXSCs.log'

else
	echo "No ticker match for... $CRYPTOMINE"
	exit 1
fi

/home/rpimpi/mpi-install/bin/mpiexec -f $HOME/Desktop/machinefile -n $NODES python $HOME/Desktop/mine/CryptoBloom/startCluster.py

exit 0
