#!/usr/bin/python

import os
import subprocess

print "Start Cluster"

crypto_script = os.environ['CRYPTOMINE']
cpu_use = os.environ['CPU_USE']
cpu_pri = os.environ['CPU_PRI']
duration = os.environ['DURATION']
worker = os.environ['WORKERNAME']

os.system('sh $HOME/Desktop/mine/CryptoBloom/{} {} {} {} {} 2>&1 &'.format(crypto_script, cpu_use, cpu_pri, duration, worker))

#subprocess.check_call("./script.sh '%s'" % arg,   shell=True)
#sh $HOME/Desktop/mine/CryptoBloom/startARQ.sh 56 1 3000 Rai-Home
#subprocess.check_call("./home/pi/Desktop/mine/CryptoBloom/startARQ.sh %s %s %s" % (56, 1, 300, 'Rai-Home'), shell=True)
#subprocess.check_call("./script.ksh %s %s %s" % (agr1, str(arg2), arg3),   shell=True)
#subprocess.call("./sleep.sh", shell=True)
print "End Cluster"

#mpiexec -f machinefile -n 2 python $HOME/Desktop/mine/CryptoBloom/startCluster.py