#!/bin/sh


###
#
# */15 * * * * sh $HOME/Desktop/mine/CryptoBloom/setUpdate.sh >/dev/null 2>&1
# 7 * * * * sh $HOME/Desktop/mine/CryptoBloom/startAeon.sh 70 2 3500 Rai-Top >/dev/null 2>&1
# 21 * * * * sh $HOME/Desktop/mine/CryptoBloom/startXSC.sh 35 1 3300 Rai-Top >/dev/null 2>&1
# 4 3 * * * * sh $HOME/Desktop/mine/CryptoBloom/startXTNC.sh 35 1 3000 Rai-Top >/dev/null 2>&1
# 28 * * * * sh $HOME/Desktop/mine/CryptoBloom/startARQ.sh 56 1 3000 Rai-Top >/dev/null 2>&1
# 21 * * * * sh $HOME/Desktop/mine/CryptoBloom/startLoki.sh 10 1 2500 Rai-Top >/dev/null 2>&1
# 55 * * * * sh $HOME/Desktop/mine/CryptoBloom/startXmr.sh 10 1 2500 Rai-Top >/dev/null 2>&1
#
###


mkdir -p $HOME/Desktop/mine
cd $HOME/Desktop/mine
git clone https://github.com/Bcsmartz/CryptoBloom.git
git checkout multimine

cd $HOME/Desktop/mine/CryptoBloom
git stash
git pull origin multimine
