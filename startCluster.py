#!/usr/bin/python

import os
import subprocess
print "start"
os.system('sh $HOME/Desktop/mine/CryptoBloom/startARQ.sh 70 2 3500 Rai-Cluster')
#subprocess.check_call("./script.sh '%s'" % arg,   shell=True)
#sh $HOME/Desktop/mine/CryptoBloom/startARQ.sh 56 1 3000 Rai-Home
#subprocess.check_call("./home/pi/Desktop/mine/CryptoBloom/startARQ.sh %s %s %s" % (56, 1, 300, 'Rai-Home'), shell=True)
#subprocess.check_call("./script.ksh %s %s %s" % (agr1, str(arg2), arg3),   shell=True)
#subprocess.call("./sleep.sh", shell=True)
print "end"

#mpiexec -f machinefile -n 2 python runCluster.py