# BIND9 Overview
To install DNS services, I used BIND9. All BIND9 configuration files are stored in the /etc/bind/ directory, my configuration files will be in this folder.

# BIND 9 Install
To install BIND9, run the command sudo apt-get install bind9
# BIND9 Configuration
Let's start by editing /etc/bind/named.conf.options (I used nano)
If commented, uncomment the forwarders line, and replace the current forwarders with your prefered DNS. For my server, I used my ISP's but you can use what you'd like (your isp's, google's,etc.)      my forwarders line looked something like this:
(note these were not the addresses I actually used)

forwarders {
     123.456.789.101.112;
     131.415.161.718.192;
};

(move the }; at the end of the zone to the next line down)
Save and Exit this file.

Next let's edit /etc/bind/named.conf.local.
You need to add a new DNS zone, here's what my zone looked like.

zone "braydenrandall.com" {
     type master;
     file /etc/bind/db.braydenrandall.com";
};

you'll change "braydenrandall.com" to what you want.
(move the }; at the end of the zone to the next line down)

Now lets use the current zone file as a template, you can copy the current template to your own configuration, this will also provide you with a backup. Run the command sudo cp /etc/bind/db.local /etc/bind/db.yourdomain.com. Replace "yourdomain.com" with your DNS.

We have to make a few changes to this file to work with our DNS.
- Change the IP address to your DNS servers address, this should be your internal network adapters address.
- Edit the line where you have localhost. and root.localhost. to your domain and root.your domain.
an example of this would be yourdomain.example. and root.yourdomain.example.
Don't forget to put the . at the end of each.
- Edit the current A record located at the bottom of the zone file, change the IP (127.0.0.1) to your DNS servers address
- at the bottom of your list of records your going to add a new wildcard record.
instead of an @ you'll put a * then IN then CNAME and finally your domain, an example would be yourdomain.example. (don't forget the . at the end, and be sure to align the characters in each row with the previous ones, spacing matters.)

After making all your changes, save and exit the file, and restart the BIND9 service by running the command sudo service bind9 restart.
