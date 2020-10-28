# Firewall Overview
I Used UFW for firewall services. My configuration files will be included in this folder.
# UFW Rules Applied
- Enable SSH: sudo ufw allow 22
- Enable DNS: sudo ufw allow 53
- Enable HTTP: sudo ufw allow 80/tcp

To test deny privileges you can deny SSH access from your ubuntu client to server by entering
sudo ufw deny proto tcp from 10.0.0.x to any port 22 (replace the x with your clients ip assuming the first three octets are the same as what I have here). 

Note that you need to have your DHCP service setup and running on your server first, for your client.

# UFW Masquerading
Masquerading allows clients on the internal (10.0.0.0/24) network to communicate with devices outside the internal network. We need to modify a few files to make this work.

Let's start by editing /etc/ufw/before.rules


