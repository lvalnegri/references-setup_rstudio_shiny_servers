## Installing Ubuntu on a physical machine

### Installation

 - Get a spare 2+ GB USB flash device / SD card
 - Download an Ubuntu flavour ISO file. You can also directly [buy](https://shop.canonical.com/product_info.php?products_id=1206) a bootable USB stick.
 - If you have a Windows OS, the easiest way is to download [Rufus](https://rufus.akeo.ie/), run it and follow instructions. You can also have a look at some graphical instructions on [Canonical webiste](https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows). 
 - Once the writing process is done, it should take around 10 mins, put the USB drive into the computer you want to install Ubuntu on, and turn it on.  
  If needed, change the BIOS settings accordingly to boot off the USB. You usually enter any BIOS menu pressing the DELete key while booting.
 - Select Install Ubuntu Server
 - Select the preferred language
 - Choose the preferred location
 - Choose a keyboard layout, or let the system detect it by you pressing a few specified keys
 - The system will now detect hardware and load the corresponding additional driver.
With multiple network interfaces installed, the installer is now going to ask which one is to be consider primary. In case the selection is a wireless adapter which is going to be used on a protected network, the installer asks for the corresponding ESSID and password before proceeding.
Enter the hostname that identifies your system to the network
When asked about a proxy, you may leave the line empty.
The system will now try to configure the network and load additional components.
Create a personal (not root) user which must have a full (real) name, a username (don't use the word admin as it is a reserved name on Ubuntu) and (obviously) a password
Choose if encrypt the home directory for the above user (It should probably be YES if installing on a portable machine)
Check the time zone
It's now time to deal with hard stuff: partitioning the disk. Most users should simply go for the guided way, and let the system use the entire disk and configure LVM (usually the selected default choice). The choice of the disk depend on the particular hardware, most users would have just one disk though. Moreover, it could be useful to leave some space unused for future needs. Anyway, DO take note of the diskname (it should be sdb, as sda may have been reserved for the USB drive).
After clicking yes on writing changes to disk, the system begin the actual installation of the OS.
Choose how you want to update the system
Choose which additional software to install. I would recommend: SSH, LAMP, Samba (I'd prefer let Lubuntu and PostgreSQL as a separate installation)
If you chose to install LAMP you will be asked to insert a password for the MySQL root user. It's not actually that important if you plan to block root login afterwards.
When ask about install GRUB on master record, answer NO. Afterwards, at the prompt where to install GRUB instead, type or select the correct diskname
The next message box is the end, remove the CD/USB/card and restart the system.
After the login, most of the subseequent steps have to be executed as a "super-user", which practically means to write sudo before every command, and inserting the password after the first command. While it's possible to login as the root user, and avoid writing permissions subsequently, it's not advisable to do so (actually, we are going to turn off the possibility for the root user to even log in in the future).

If you did not select to install the OpenSSH server during the system installation, but you nonetheless want now to connect to the system with an SSH client from remote, you can do it now: sudo apt-get install ssh openssh-server

I tend to suggest to newbie to use the pre-installed nano for its apparent simplicity, but if you want to use the more popular vim I suggest to install the nox version: sudo apt-get install nano vim-nox

Port forwarding

Dynamic DNS (or DDNS)

Mounting additional devices
