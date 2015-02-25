#!/bin/sh
sudo sh -c 'for dev in /sys/bus/usb/devices/*/power/autosuspend; do echo -1 >$dev; done'

