# this module should generate desired number of sequences and dump them to 
# seq.toml
# command-line arguments are 
#   - reset             --> reset interval(in nano second)
#   - clock-period      --> time period of each interval

import argparse
import toml
import random
import os

ap = argparse.ArgumentParser()
ap.add_argument("-ri", "--reset", required=True, help="set reset interval")
ap.add_argument("-ti", "--tick", required=True, help="time interval for clock")
ap.add_argument("-n", "--number", required=True, help="number of sequences")
args = vars(ap.parse_args())
if int(args['reset']) > 5:
    print("reset must be atmost 5 ticks")
    exit(1)
seq_file = os.path.abspath("./seq.toml")

data = {
    "sequence" :    [random.choice([0, 1]) for i in range(int(args['number']))],
    "reset" :       int(args['reset']),
    "time_period" : int(args['tick'])
}

with open(seq_file, 'w') as f:
    f.write(toml.dumps(data))


print('DONE')
