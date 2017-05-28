#### TWEAK THE SYSTEM

 - install VboxGuestAdditions (menu: Devices => Insert  CD ... )
 
	   centos: 
	   https://www.if-not-true-then-false.com/2010/install-virtualbox-guest-additions-on-fedora-centos-red-hat-rhel/
		
		yum install dkms binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers 
		yum install kernel-devel


 - if on a GUI open terminal
	- sudo apt-get update
	- sudo apt-get upgrade
	- sudo apt-get dist-upgrade
   
 
 - Add your user to permission group for shared folders: sudo adduser username vboxsf (read only, whatever the settings!)
 
 - access guest servers from host browsers: (see https://askubuntu.com/questions/52147/how-can-i-access-apache-on-virtualbox-guest-from-host)
 
 
 https://www.swiftstack.com/docs/install/configure_networking.html
/etc/network/interfaces describes the network interfaces
/etc/hostname configures the nameserver credentials
/etc/hosts resolves IP addresses to hostnames
 
 - access MySQL host from guest: 
   
