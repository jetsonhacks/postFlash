# postFlash
Post flash setup for NVIDIA Jetson TK1 Development Kit. After flashing the Jetson, there are a couple of extra settings that are changed for better desktop performance. These enhancements are for people who use the Jetson as a desktop type of machine.

To configure the system, download this repository. Open a Terminal, switch to the repository directory, and exectue the configureSystem switch, i.e.

$ cd postFlash
$ ./configureSystem.sh

Install notes:

Because Firefox on the Jetson has issues downloading zip files from github on the Jetson, the Chromium browser is installed. 

To save power, the Jetson will autosuspend the USB ports. In a desktop environment, this may cause problems with various USB devices such as webcams. The installed startup script will disable USB autosuspend.

As a mobile device, the Jetson is configured to save power by promoting lower clock speeds and turning off cores. As a desktop machine, this is not as much of a concern so a startup script to maximize CPU and GPU performance is installed.

USB 3.0 is disabled in the stock setup, this script enables USB 3.0 on startup.

Startup scripts are stored in /usr/local/bin
