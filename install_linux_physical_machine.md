## Installing Ubuntu on a physical machine

### System Installation

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

### Change ip mode to static address

- run `ifconfig` to check the id of yhe network card used by the  system
- `sudo nano /etc/network/interfaces`
- add following lines:
```
iface eno1 inet static
  address 192.168.x.yyy
  netmask 255.255.255.0
  network 192.168.x.0
  broadcast 192.168.x.255
  gateway 192.168.x.1
  dns-nameserver 8.8.8.8 8.8.4.4
```
where x is linked to the local network, while yyy is the requested fixed internal IP address for the server.

### Change services ports numbers, and port forwarding in router configuration

 HTTP     80 =>  
 HTTPS       => 
 SSH      22 => 7345
 WEBMIN      => 4948
 SAMBA       => 
 MYSQL       => 
 XRDP        => 
 RSTUDIO     => 
 SHINY       => 
 NEO4J       => 
 CALIBRE     => 


### Change SSH port & Disable SSH root access

 - Open SSH configuration file: `sudo nano /etc/ssh/sshd_config`

 - Insert/change the following lines: 
   ```
   Port xxxx
   Protocol 2
   PermitRootLogin no
   DenyUsers root
   AllowUsers username

   HostKey /etc/ssh/ssh_host_zzz_key
   UsePrivilegeSeparation yes

   RSAAuthentication yes
   PubkeyAuthentication yes
   ```

 - Restart the service afterwards:  `sudo service ssh restart`


#### Install a firewall (*fail2ban*)

First, go through the actual installation: `sudo apt-get install fail2ban`

Then make a copy of the default settings: `sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local`

Personalise the defaults open the configuration file for editing: `sudo nano /etc/fail2ban/jail.local`:

write down personal IP addresses into the ignoreip line, separating each address with a space

add the new SSH port if changed: 

Stop & restart the service: `sudo service fail2ban stop && sudo service fail2ban start`

Check if the new rules have been appled: `sudo iptables -S`


#### Install an antivirus (ClamAV) 

First, go through the actual installation: `sudo apt-get install clamav clamav-daemon -y`

Run the initial configuration process: `sudo dpkg-reconfigure clamav-base`

Grab the most recent virus definitions: `sudo freshclam`

Restart the service: `sudo /etc/init.d/clamav-daemon start`

Check files in a specified directory: sudo clamscan -r /path/to/check

Scan and remove virus files: sudo clamscan --infected --remove --recursive /path/to/clean

Check clamd status: sudo /etc/init.d/clamav-daemon status

Verify ClamAV version number: sudo clamdscan -V

To routinely scan certain directories, run the following script as a cronjob:

Open the editor as `su` for a new file: `sudo nano /path/to/script.sh`

Write down the following:
```
#!/bin/sh
rm -R /var/log/nightly-clamav-scan.log
touch /var/log/nightly-clamav-scan.log
clamdscan /home/ /etc/ /var/www/ --infected --multiscan --fdpass --log=/var/log/nightly-clamav-scan.log
```
Make the script executable: `chmod +x /path/to/script.sh`

Open up crontab editor: `sudo crontab -e` 
and add the following line to schedule it to run (for example) at midnight each night: `0 0 * * * /bin/sh /path/to/script.sh`


#### Main commands worth remembering for monitoring accesses

 - List all the previous attempted login to the system: `sudo less /var/log/auth.log`
 - List the most recent successful login: `last`
 - View the last time each user on the system logged in: `lastlog`


### Webmin

#### Installation

 - Open the list for editing: sudo nano /etc/apt/sources.list
 - Add the following lines at the end of the file: 
   deb http://download.webmin.com/download/repository sarge contrib
   deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib
 - Install the GPG key to access the repository: 
   wget http://www.webmin.com/jcameron-key.asc
   sudo apt-key add jcameron-key.asc
 - Update packages list: sudo apt-get update
 - Install webmin: sudo apt-get install webmin

#### Secure the 

 - Navigate to the URL https://url:10000/, then enter the username and password to log in to webmin console.
 - Enable SSL Access: Webmin -> Webmin Configuration -> SSL Encryption
 - Change Default Port to some random number xxxxx: Webmin -> Webmin Configuration -> Ports and Addresses
 - Allow access via firewall, if you want to access the Webmin console from a remote system: sudo ufw allow xxxxx
 - Remove access to the standard port 10000: sudo ufw deny 10000

#### Add Two Factor Authentication (2FA)





### MySQL

#### Installatiopn and configuration

If not already installed, proceed with all the following:
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install mysql-server
```
When asked about the *root* password you should always leave it blank as we'll change it later.

When the installation finish, run `sudo mysql_secure_installation`, then:
 - enter a strong password for *root*
 - remove the *anonymous* user
 - disallow *root* remote login
 - delete test database
 - and finally reload privileges.


#### Adding user(s)

 - Open the terminal and login as root: `mysql -u root -p`
 - Create the user: `CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypass';`
 - Grant privileges: 
   - all privileges: `GRANT ALL ON *.* TO 'myuser'@'localhost';`
   - admin privileges: 
   - common user: 
 - Update the server: `FLUSH PRIVILEGES;`
 - However, for a remote user to connect even with the correct privileges, the previous commands have to be repeated with the correct IP instead of localhost, inserting '%' everywhere as a  Shortly, to let a user connect from anywhere the correct commands are the following:
```
CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass';
GRANT ALL ON *.* TO 'myuser'@'%';
```

#### Configure and tweaking the server

First of all, install the standard program to monitor performance: `sudo apt-get install mysqltuner`
This program should be run periodically to get insights into the server efficiency, and have some feedback clues into how to tweak the configuration.

Let's open now the configuration file: `sudo nano /etc/mysql/my.cnf`

 - To expose MySQL to a specific IP, scroll to the position with `bind-address = 127.0.0.1`, which stand for `localhost`, i.e. the machine itself, and substitute that address with the one you want to coonnect. If instead you want to connect from anywhere write down `bind-address = 0.0.0.0`
 - To change the port the server listen to, scroll down to the lines (two!) `port = 3306`, and put the desired number in both [client] and [mysqld] submenus.

- Change general ENGINE to MYISAM adding the row `default_storage_engine=MYISAM`
- Control that general character set is UTF8 and general collation is UTF8_unicode_ci:
  ```
  [client]
  default-character-set=utf8

  [mysql]
  default-character-set=utf8

  [mysqld]
  collation-server = utf8_unicode_ci
  init-connect='SET NAMES utf8'
  character-set-server = utf8
  ```
- tweak parameters so that the maximum potential RAM is less than 1/k of the installed RAM

To ensure the changes take effect, remember to restart the server: `sudo service mysql restart`


#### Web interface

While not compulsory, having a web interface to access the server from a browser anytime anywhere in the world could be quite helpful.
My preferred one is [DB Ninja](http://www.dbninja.com/), which is a proprietary software but totally free for personal use, and also for work if it used from a single computer at any single time.

 - Install APACHE: `sudo apt-get install apache2`. To check whether the server is working, open the browser and run the URL `http://your_IP/`.
 - Install PHP: `sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt`. To check whether PHP is working, create a file index.php in `/var/www/html` with the code `<?php phpinfo(); ?>``, and run the previous URL again. You should be greeted by a lot of info about PHP.
 - Install some auxiliary library: `sudo apt-get install libapache2-mod-auth-mysql php5-mysql php5-json`
 - Restart the server: `sudo service apache2 restart`.
 - Install DBNinja:
   - download the file `wget http://www.dbninja.com/download/dbninja.zip`
   - unzip the file `unzip dbninja.zip`
   - move the zip content in a new directory, possibly with a different name `mv dbninja /var/www/html/mysqlmanager`
   - set the correct read/write permission to the `_users' directory` in the previous destination directory `chmod 777 /var/www/html/mysqlmanager/_users/`
   - run the URL `http://your_IP/mysqlmanager/` and follow the intructions
   - rename the `_users/admin` directory to something unique, to force any perpetrator to guess the username in addition to the password.



### Dynamic DNS (or DDNS)



### Mounting additional devices



### Neo4j

#### Installation

 - add the Neo4j key into the apt package manager:
   sudo su
   wget -qO - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -

 - add Neo4J to the apt sources list: sudo echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee --append /etc/apt/sources.list.d/neo4j.list

 - update the apt package list: sudo apt-get update

 - install neo4j: sudo apt-get install neo4j

 - ensure the server is running: service neo4j-service status

 - the server is listening on default port 7474

#### Access to the web

 - open the neo4j config file for edit: sudo nano /etc/neo4j/neo4j-server.properties

 - Uncomment the line #org.neo4j.server.webserver.address=0.0.0.0 to allow connection from ANY external URL

 - restart the Neo4j service: sudo service neo4j-service restart

