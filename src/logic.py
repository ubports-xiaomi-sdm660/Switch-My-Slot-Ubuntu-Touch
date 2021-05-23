import pyotherside
import os

prefix = 'unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl '

stream = os.popen(prefix + 'hal-info')
output = stream.read()
pyotherside.send('halVersion', output)

stream = os.popen(prefix + 'get-number-slots')
output = stream.read()
pyotherside.send('noOfSlots', output)

stream = os.popen(prefix + 'get-current-slot')
output = stream.read()
temp = output

if temp.__eq__(0):
    pyotherside.send('currentSlot', "A")

elif s1.__eq__(1):
    pyotherside.send('currentSlot', "B")

stream = os.popen(prefix + 'get-suffix ' + temp)
output = stream.read()
pyotherside.send('currentSlotSuffix', output)

def switchSlotFunc():
    if temp.__eq__(0):
        os.system(prefix + 'set-active-boot-slot ' + '1 && sudo reboot') # will only reboot if no password is set on device
    elif temp.__eq__(1):
        os.system(prefix + 'set-active-boot-slot ' + '0 && sudo reboot')
