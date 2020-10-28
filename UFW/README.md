# Firewall Overview
I Used UFW for firewall services. My configuration files will be included in this folder.
# UFW Rules Applied
- Enable SSH: sudo ufw allow 22
- Enable DNS: sudo ufw allow 53
- Enable HTTP: sudo ufw allow 80/tcp

To test deny privileges you can deny SSH access from your ubuntu client to server by entering
sudo ufw deny proto tcp from 10.0.0.x to any port 22 (replace the x with your clients ip assuming the first three octets are the same as what I have here). 

Note that you need to have your DHCP service setup and running on your server first for your client to use the following configurations.

# UFW Masquerading
Masquerading allows clients on the internal (10.0.0.0/24) network to communicate with devices outside the internal network. We need to modify a few files to make this work.

Let's start by editing /etc/ufw/before.rules with a text editor (I used nano)
![githubufwconfig](https://user-images.githubusercontent.com/73500216/97432923-7bee3a00-18fb-11eb-8364-2fc997280c0c.JPG)
You'll want to add the lines that are uncommented, preferably near the top of your document. The only change you may have to make is your postrouting statement. Mine is forwarding traffic from my internal network (10.0.0.0/24) to my external network adapter (ens33). Be sure to put your internal network and external network adapter (you can check these by typing ifconfig). Once you have added these lines, save & exit this file.

Next we need to make a small change in /etc/default/ufw.
Change DEFAULT_FORWARD_POLICY from DROP to ACCEPT.
Save and exit this file.

Last file to edit, open the /etc/ufw/sysctl.conf.
Uncomment net/ipv4/ip_forward=1 & net/ipv6/conf/default/forwarding=1.
You cann uncomment lines by deleting the # in front of them, also note you only have to uncomment net/ipv6/conf/default/forwarding=1 if your using ipv6, I did not uncomment this line since my DHCP Client is using an ipv4 address. Once you've made your changes, save and exit this file.

After you've configured these run the command sudo ufw disable && sudo ufw enable to disable and   re-enable your firewall.
