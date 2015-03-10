# postFlash
Post flash setup for NVIDIA Jetson TK1 Development Kit. After flashing the Jetson with L4T 21.X, there are a couple of extra settings that can changed for better performance when using the Jetson as a desktop. 

To configure the system, clone this repository with the appropriate 'Tag'. For example,

$ git clone -b JetsonTK1-L4T-21.3 https://github.com/jetsonhacks/postFlash.git

will clone the appropriate code for the L4T-21.3 release. These scripts are currently available for L4T-21.3 and L4T-21.2.

Once downloaded, open a Terminal, switch to the repository directory, and execute the configureSystem switch, i.e.

$ cd postFlash

$ ./configureSystem.sh

Install notes:

Because Firefox on the Jetson has issues downloading zip files on the Jetson, the Chromium browser is installed. 

To save power, the Jetson will autosuspend the USB ports. In a desktop environment, this may cause problems with various USB devices such as webcams. The installed startup script will disable USB autosuspend.

As a mobile device, the Jetson is configured to save power by promoting lower clock speeds and turning off CPU cores. As a desktop machine, this is not as much of a concern, so a startup script to maximize CPU and GPU performance is installed. There is some extra power draw after this procedure (~0.5W).

USB 3.0 is disabled in the stock setup, this script enables USB 3.0 on startup.

Startup scripts are stored in /usr/local/bin
