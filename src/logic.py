import pyotherside
import os

stream = os.popen('unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl hal-info')
output = stream.read()
pyotherside.send('halVersion', output)

stream = os.popen('unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl get-number-slots')
output = stream.read()
pyotherside.send('noOfSlots', output)

stream = os.popen('unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl get-current-slot')
output = stream.read()
temp = output

if temp.__eq__(0):
    pyotherside.send('currentSlot', "A")

elif s1.__eq__(1):
    pyotherside.send('currentSlot', "B")

stream = os.popen('unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl get-suffix ' + temp)
output = stream.read()
pyotherside.send('currentSlotSuffix', output)

def switchSlotFunc():
    if temp.__eq__(0):
        os.system("unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl set-active-boot-slot " + "1 && sudo reboot")
    elif temp.__eq__(1):
        os.system("unset LD_PRELOAD; unset LD_LIBRARY_PATH; /system/bin/bootctl set-active-boot-slot " + "0 && sudo reboot")
