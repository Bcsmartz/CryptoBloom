#!/usr/bin/python

import os
import subprocess

print "Start Cluster"

duration = os.environ['DURATION']
worker = os.environ['WORKERNAME']
crypto_script = os.environ['CRYPTOMINE']

os.system('timeout "{}s" sh $HOME/Desktop/mine/CryptoBloom/cluster/{} {} {} &'.format(duration, crypto_script, duration, worker))

#subprocess.check_call("./script.sh '%s'" % arg,   shell=True)
#sh $HOME/Desktop/mine/CryptoBloom/startARQ.sh 56 1 3000 Rai-Home
#subprocess.check_call("./home/pi/Desktop/mine/CryptoBloom/startARQ.sh %s %s %s" % (56, 1, 300, 'Rai-Home'), shell=True)
#subprocess.check_call("./script.ksh %s %s %s" % (agr1, str(arg2), arg3),   shell=True)
#subprocess.call("./sleep.sh", shell=True)

crypto_log = os.environ['CRYPTOLOG']
#mpiexec -f machinefile -n 2 python $HOME/Desktop/mine/CryptoBloom/startCluster.py
os.system("echo hostname 'Started!!!'")
#os.system('tail -f $HOME/Desktop/mine/{}'.format(crypto_log))