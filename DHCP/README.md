# DHCP Overview
All DHCP configuration files will be saved in the directory /etc/dhcp/ and my configuration files will be in this folder. 
# DHCP Install
To install DHCP, run the command sudo apt-get install isc-dhcp-server
(NOTE: you will need internet access.)
# DHCP Configuration
to configure dhcp you have to edit the /etc/dhcp/dhcpd.conf file using a text editor (I Used Nano)
and if you want to be able to edit and write to the file, you have to sudo the command.
![githubdhcpconfig](https://user-images.githubusercontent.com/73500216/97350020-f755da00-186e-11eb-903d-d99fe06078bc.JPG)
for your configuration, your subnet will be the network you want to assign addresses on, netmask is the subnet mask your going to use, range will be your DHCP range of available addresses, and your option routers will be the address of your servers internal network adapter.

After making changes be sure to write and save to the file, also use the command sudo service isc-dhcp-server restart to restart this service. You can substitute restart for start/stop to turn on/off this service.
