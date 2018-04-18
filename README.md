# Jumping-PEAP

From longtime, I would to connect my Parrot jumping to my Enterprise network and Go everywhere in the building.
"Unfortunately", all my enterprise wifi was WPA2 Enterprise (PEAP + MSVCHAPV2) wich is not available in stock firmware. 

But Now It's Possible:

Requirement : 
 - Jumping Night/Race (EVO) Doesn't work on Sumo because no more RAM
 - My CoyoteProd Libsumo.Net Application (or other application able to change the IPAddress to connect to drone)
 - Windows PC (not mandatory)
 
 Required only if you brick your jumping:
 - Latest Firmware
 - USB Cable 

Installation:
 - Check the file LinuxFiles\wpa_supplicant.conf and adapt the file to your network configuration. Be sur to use MD4 hashing for the password (dont write it in clear, because the drone have no security protection at all...)
   to hash your password you can use: `echo -n %cleartextpassword% | iconv -t utf16le | openssl md4` on a linux computer
 - Insert new battery in drone
 - Power On
 - Connect to Drone Wifi 
 - Connect to Drone with FTP
 - Go to internal_000
 - Create folder wpa_supplicant
 - upload all files of this repository LinuxFiles folder
 - Connect to Drone with Telnet
 - Go to /data/ftp/internal_000/wpa_supplicant
 - Check that all file haves execute right (use chmode if not)
 - Execute ./install.sh
 

Now when you power On your drone it's in normal mode, it's work the same from stock with Parrot Application.
But when you press one time on the power button, the drone will begin the connection to your network.
And you can use your favorite applications to pilot your drone and virtually rolling where your network coverage go...

Some notes:
 - Change the drone name to easily access it when it's connected to your network (nslookup)
 - It's compatible with eduroam network too
 - Check Wiki to view how to compile your own wpa_supplicant for ARM51
 


in case of problem with your drone... :
 - first, dont not take me responsible... you made change to your drone at your own risk
 - Here a little procedure to revert your drone back to life. (tested and approved be myself when I have accidentally unconfigured wifi card...)

Have fun... !


 If you Brick your Jumping :
  - Remove Battery of jumping
  - Connect your Jumping to USB
  - Wait to Green LED
  - Press 4 times on the power button
  - Wait that a new driver come in DeviceManager
  - Install Microsoft Remote RNDIS Driver
  
[![Install Microsoft Remote RNDIS Driver][1]][1]
[![enter image description here][2]][2]

  - be sure to ping your device (by default 192.168.3.1), use ipconfig and set address manually if not
  - Connect with Telnet on 192.168.3.1
  - Modify  /etc/inetd.conf to allow FTP to start in root

    change `21 stream tcp nowait root ftpd ftpd -w /data/ftp`    
    to `21 stream tcp nowait root ftpd ftpd -w /`
  - get the name in /bin/updater/productname file (for renaming the firmware file)
  - restart ftp serveur or reboot and re-press 4 times on power button
  
  - download latest (or the same) firmware on Parrot site (be careful to download the firmware for your drone)
  - rename the file in %productname%_update.plf (for night: jumpingsumo_update.plf)   
  - Connect with FTP to 192.168.3.1  
  - upload firmware in /update folder
  - Wait 2 min (to be sure filesystem is flushed)
  - Reboot and Wait
  - It's all
  
  [1]: https://i.stack.imgur.com/0IaqO.png
  [2]: https://i.stack.imgur.com/z0OqL.png
