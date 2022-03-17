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
    fd = c.open_set(b'/dev/ttyUSB1')
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

motor_s.id = 2
motor_s.mode = 10
motor_s.T = -0.035          #单位：Nm, T<255.9
motor_s.W = -1.315  #单位：rad/s, W<511.9
motor_s.Pos = -0.05*9.1       #单位：rad, Pos<131071.9
motor_s.K_P = 0.01       #K_P<31.9
motor_s.K_W = 1      #K_W<63.9

motor_s1.id = 2
motor_s1.mode = 0

print(bin(motor_s.mode))

c.modify_data(byref(motor_s))
print(bin(motor_s.motor_send_data.Mdata.mode))

c.modify_data(byref(motor_s1))

c.send_recv(fd, byref(motor_s1), byref(motor_r))
print('START')

c.send_recv(fd, byref(motor_s), byref(motor_r))
time.sleep(2)

c.send_recv(fd, byref(motor_s1), byref(motor_r))
print('END')

c.close_serial(fd)
