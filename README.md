# Ubuntu Server Overview
This document is for installing and configuring Ubuntu Server 20.04.
This server will have 2 virtual network adapters, an external (192.168.x.0/24) and an internal 
(10.0.0.0/24). The following services will be configured:

- DNS: BIND9 is used for address resolution on the internal network.
- DHCP: dynamic host configuration protocol is setup to give out ip addresses on
  the internal 10 network.
- UFW: UFW is used to configure firewall rules and settings. IP Masquerading is configured to allow a     client on the 10 network to communicate with the external network & internet.
- SQUID: Squid is used as a transparent proxy server, and is used to block traffic on the 10 network.

# Ubuntu Server 20.04 Install
Before starting your ubuntu server install you'll need the following:
- A Hypervisor (VMWare, Virtual Box, etc.)
- Ubuntu Server 20.04 ISO (obtainable on ubuntu's website)

As noted in the Overview you need to have 2 virtual network adapters, the first one will be fine set to NAT (in your hypervisors network settings) for now, your second adapter should be set to host-only. aside from this all default configurations for the server should be fine.

Once all this is configured and your servers up and running, you should apply static ip's to your 2 adapters. your external adapter should be on the same network as your current workstation (you can check your ip using cmd and typing ipconfig). For example my ip was 192.168.1.139/24 and my router was 192.168.1.1/24, so I set my servers external adapter to 192.168.1.225 (you'll want to apply a static ip outside your home networks dhcp range), your home router will be your servers default gateway. I also used the name servers 8.8.8.8 & 8.8.4.4. Those are all the configurations to your external network adapter. For your internal network you can apply any ip to it, but I used 10.0.0.250/24 as mine.

