# Client Machine

The client machine you choose is your choice, I used Ubuntu 18.04.
In your hypervisor default settings will do, all you need is to make sure your network adapter is set to the same network as your internal adapter (10.0.0.0/24) on your server, since this machine will be your client for DNS & DHCP, plus your test subject for UFW & Squid. 
