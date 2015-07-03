#!/bin/sh
# Configure a NVIDIA Jetson TK1 post flash - L4T 21.3
# Configure for desktop, maximum performance, USB 3.0
# These repositories should already be in place, but check to make sure

sudo apt-mark hold xserver-xorg-core # http://elinux.org/Jetson_TK1#An_important_step_before_connecting_the_Jetson_to_Internet

sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-get update
sudo apt-get install bash-completion command-not-found -y
# Assuming this is a development machine, we do not need shopping tips
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', \
    'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', \
    'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

sudo apt-get install chromium-browser -y
sudo apt-get install git -y
sudo apt-get install aptitude -y

sudo apt-get install build-essential qt5-default qtcreator -y

# Add scripts to disable USB autosuspend, run at maximum performance
sudo cp maxPerformance.sh /usr/local/bin
# And add them to the startup script, as well as a few other tidbits
sudo cp rc.local /etc
# and setup USB 3.0 port to run USB; usb_port_owner_info=2 indicates USB 3.0
sudo sed -i 's/usb_port_owner_info=0/usb_port_owner_info=2/' /boot/extlinux/extlinux.conf
# Disable USB autosuspend
sudo sed -i '$s/$/ usbcore.autosuspend=-1/'  /boot/extlinux/extlinux.conf
# /bin/ required for echo to work correctly in /bin/sh file
/bin/echo -e "\e[1;32mPlease reboot for changes to take effect.\e[0m"

