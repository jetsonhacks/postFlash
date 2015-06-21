#!/bin/sh

#as per suggestion: https://devtalk.nvidia.com/default/topic/785551/my-jetson-focused-linux-tips-and-tricks/
# "It takes a quite a while to login with ssh as Ubuntu checks for updates. To disable that, edit"

/etc/update-motd.d/90-updates-available
/etc/update-motd.d/91-release-upgrade

exit 0
