#!/bin/sh
# Configure a NVIDIA Jetson TK1 post flash - L4T 21.2
# Configure for desktop, maximum performance, USB 3.0
# Addresses Ethernet 1Gb/S issue by slowing down port to 100Mb
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-get update
sudo apt-get install bash-completion command-not-found -y
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', \
    'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', \
    'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

sudo apt-get install chromium-browser -y
sudo apt-get install git -y
sudo apt-get install aptitude -y

# Add scripts to disable USB autosuspend, run at maximum performance
sudo cp disableUSBAutosuspend.sh /usr/local/bin
sudo cp maxPerformance.sh /usr/local/bin
# And add them to the startup script, as well as a few other tidbits
sudo cp rc.local /etc
# and setup USB 3.0 port to run USB; usb_port_owner_info=2 indicates USB 3.0
sudo sed -i 's/usb_port_owner_info=0/usb_port_owner_info=2/' /boot/extlinux/extlinux.conf
# /bin/ required for echo to work correctly in /bin/sh file
/bin/echo -e "\e[1;32mPlease reboot for changes to take effect.\e[0m"

