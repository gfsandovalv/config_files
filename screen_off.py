#!/usr/bin/env python3
import subprocess
import time
import sys

# read arguments from the run command: idel time (in seconds)
dimtime = int(sys.argv[1])*1000
# brightness when dimmed (between 0 and 1)
dimmed = float(sys.argv[2])

def get(cmd):
    """Return the output of bash command"""
    # just a helper function
    return subprocess.check_output(cmd).decode("utf-8").strip()

def get_value():
    """Get and return the maximun and the current values of brightness"""
    path = '/sys/class/backlight/intel_backlight/'
    with open(path + 'brightness') as current_b, open(path + 'max_brightness') as max_b:
        c = int(current_b.read())
        m = int(max_b.read())
        return m, c
    
def set_brightness(percentage, base='max'):
    """Change the value of value of the brightness.
    If base='max', the setted value is based on the maximum value avalaible for the screen brightness.
    If base='current', the setted value is based on the current brightness of the screen.
    """
    m, c = get_value()
    path = '/sys/class/backlight/intel_backlight/'
    with open(path + 'brightness', 'w+') as f:
        base_value = None
        if base == 'max':
            base_value = m
        elif base == 'current':
            base_value = c
        f.write(str(int(float(base_value*percentage))))
        
# initial state (idle time > set time
check1 = False
changed = False
while True:
    time.sleep(1)
    # get the current idle time (millisecond)
    t = int(get("xprintidle"))
    # see if idle time exceeds set time (True/False)
    check2 = t > dimtime
    # compare with last state
    
    if check2 != check1:
        # if state chenges, define new brightness...
        newset = dimmed if check2 else 1
        set_brightness(newset, base='current')
        # store wheather the brightness has been changed 
        changed = True
        # set current state as initial one for the next loop cycle
        check1 = check2

    t = int(get("xprintidle"))
    if (t < dimtime) and (changed == True):
        oldset = 1.0/dimmed
        print(oldset)
        set_brightness(oldset, base='current')
        # lets the state as the initial one (the brightness is the intial one)
        changed = False
