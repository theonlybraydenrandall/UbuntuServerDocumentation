# SQUID Overview
For proxy services I used Squid. The configuration files for Squid are in the /etc/squid directory, and I will include my configuration files.
# SQUID Install
To install Squid, run the command sudo apt-get install squid.
# SQUID Configuration
Your squid configurations are done in the /etc/squid/squid.conf file.
![githubsquidconfig](https://user-images.githubusercontent.com/73500216/97374084-3f3c2780-1896-11eb-8e10-408b751147bd.JPG)
I added some acls, the name "ubuntu" was for my client, but you can put what you want there, and don't forget to change your internal address if you used something different than 10.0.0.0/24.

To make things easy, I created a new file "denied-sites.squid" inside the /etc/squid directory for my list of blocked websites. This way all my blocked sites are in one location and it's easy to add them. When adding a new blocked site, avoid putting the www prior to the site name. In my case, I blocked www.neverssl.com, to do so, my acl was just ".neverssl.com" I also blocked ".youtube.com" to test an extra site, but you can block any site you choose. Also note that you have to allow the port squid uses (3128) through your firewall (if you have one setup) you can find this setting labeled as      "http_port 3128" a ways down in your squid.conf file. On that note, you have to add your internal adapters ip address to this configuration, so mine looks like "http_port 10.0.0.250:3128".

Once your configurations are complete and you save you configuration, you can restart squid by entering sudo service squid restart. This will block your client machine from accessing the websites on your blocked website list.
