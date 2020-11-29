# Switch My Slot

Switch My Slot is an Ubuntu Touch app that helps you switch between android system A & system B slots if you are dualbooting with Android OS on an Android A/B device. This app saves you from the hassle of needing to use ssh/terminal/twrp while wanting to switch to another Android slot.

Library used: bootctl

What is A/B partitioning?

https://source.android.com/devices/tech/ota/ab

https://www.xda-developers.com/how-a-b-partitions-and-seamless-updates-affect-custom-development-on-xda/

## Requirements
1. Device with A/B partitions
2. If your target device is not Xiaomi Mi A2 (jasmine_sprout) you need to compile your own bootctl library (+ set it as executable) and put it into /bin/ and finally recompile the project.

[Checkout Android version](https://github.com/shoukolate/Switch-My-Slot-Android)

[Checkout SailfishOS version](https://github.com/SailfishOS-MI-A2/Switch-My-Slot-SailfishOS)

<p align="center">
  <img src="https://github.com/ubports-xiaomi-sdm660/Switch-My-Slot-Ubuntu-Touch/raw/master/Screenshots/1.png">
</p>

## License

Copyright (C) 2020 - 2021  Shouko

Licensed under the MIT license