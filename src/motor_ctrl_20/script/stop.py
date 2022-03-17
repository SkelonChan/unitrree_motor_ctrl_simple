#!/usr/bin/env python3
import os
import sys
from typedef import *
from ctypes import *
import time


system=platform.system()
if system == 'Windows':
    fd = c.open_set(b'\\\\.\\COM12')
    libPath = os.path.dirname(os.getcwd()) + '/lib/libUnitree_motor_SDK_Win64.dll'
elif system == 'Linux':
    fd = c.open_set(b'/dev/ttyUSB0')
    maxbit=sys.maxsize
    if maxbit>2**32:
        libPath = os.path.dirname(os.getcwd()) + '/lib/libUnitree_motor_SDK_Linux64.so'
        print('Linux 64 bits')
    else:
        libPath = os.path.dirname(os.getcwd()) + '/lib/libUnitree_motor_SDK_Linux32.so'
        print('Linux 32 bits')

c = cdll.LoadLibrary(libPath)

motor_s = MOTOR_send()
motor_s1 = MOTOR_send()
motor_r = MOTOR_recv()


motor_s1.id = 0
motor_s1.mode = 0
motor_s.id = 2
motor_s.mode = 0


c.modify_data(byref(motor_s))
print(bin(motor_s.motor_send_data.Mdata.mode))

c.modify_data(byref(motor_s1))

c.send_recv(fd, byref(motor_s1), byref(motor_r))
time.sleep(0.001)
c.send_recv(fd, byref(motor_s), byref(motor_r))
print('END')

c.close_serial(fd)
