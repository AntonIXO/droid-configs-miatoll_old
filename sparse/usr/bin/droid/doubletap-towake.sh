#!/bin/sh

# this actually sends an input_event struct
# to get here in the kernel https://github.com/b100dian/Xiaomi_Kernel_OpenSource/blob/tucana-hybris-17.1/drivers/input/touchscreen/fts_521/fts.c#L6705
# TODO add a sysfs simple interface in the kernel
printf "%b" '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x05\x00\x00\x00' > /dev/input/event1
