# Tutorials
## Enable Internet on Linux VM
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/e632c217-45d5-4735-a6b9-cba07afe4ece)
- Ping is the command that is used to communicate to other servers.
- ```
  su -
  reboot
  ifconfig | more
  ping www.google.com
  ```
- So now we know that our machine is ready. It's on the network. We could download the packages, we could install the packages, anything that we want, it has ability to go on online.
## Network Components
- `IP`: IP stands for internet protocol.
- `Subnet mask`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/f16cd5da-7164-438a-9353-03235ecc37d6)
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/4f7d34a1-4ce7-46a4-b812-f674cbd97038)
- `Gateway`: tells your computer which route you have to pick to send you traffic out and to receive your traffic in. So if you are in your home environment, your modem, the IP address of your modem will be your gateway.
- `Static vs DHCP`:
    -  if you are given an IP address from your company, from your corporate environment and you have to assign a dedicated IP to your machine, that is called static and when you reboot your machine that IP does not change. Whereas if it is set up as DHCP, the IP address will change.
    -  It will pick an IP from a pool of IP addresses and every time your system is rebooted, most likely it will change its IP address. So in most of the corporate environment, you'll be setting up a static IP address.
- `Interface`: if you look at your laptop or your computer, in the back of it, there's a port where you connect your CAT-5 cable. That's a interface, a NIC card.
- `Interface MAC`: So interface always have a Mac address that is a permanent MAC address to your NIC, associated with your card and this MAC address never changes.
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/d9853510-7765-4095-b435-c7978ef09048)
## Network Files and Commands (ping, ifconfig, ifup, ifdown, netstat, tcpdump)
There are many network files and commands that needs to be used in order to configure your machine and bring it online or bring it to the network so it could communicate from one machine to another.
- `Interface Detection`:
- ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a583cc1c-7d68-447c-b95d-99ca9079e7b8)
- `Assigning an IP address`: Assigning an IP address to the system is very important when you bring up a system and you need to have it on the network.
- `Interface configuration files`:
   - `/etc/nsswitch.conf`: which tells the system where it should resolve its hostname to IP address. Run  `cat /etc/nsswitch.conf`
   - `/etc/hosts`: is where you define your system IP address and system hostname.
      ```
      ifconfig | more
      su -
      vi /etc/hosts
      // Go to the bottom and put IP address from `ifconfig`
      Example: 192.168.1.14 myFirstLinuxOS
      ping myFirstLinuxOS
      ```
  - `/etc/sysconfig network`: So this is the file where you specify your hostname as well.
  - ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/f41ca2b6-04ca-43b1-ba58-639a2c63cb94)
  - `/etc/sysconfig/network-scripts`: this the folder
     ```
     cd /etc/sysconfig/network-scripts
     ls -ltr
     //Display `ifcfg-enp0s3` is interface
     vi ifcfg-enp0s3 // to modify `BOOTPROTO` and others

     ```
  - `/etc/resolv.conf`: specifies your DNS server. DNS server is, once again, it actually resolve hostname to IP, IP to hostname and hostname to hostname.
  - `Network Commands`:
      - `ping`: If you wanted to ping a server, let's say `ping www.hotmail.com`, that's a server outside
      - `ifconfig`: tells you what your interfaces are in the system. We have right now three interfaces
      - You have `ifup` or `ifdown`: If you want to bring down this interface, if you don't want a network, you could type `ifdown`. Or if you want to bring it back up, you type `ifup`.
      - `netstat`: you could run with different options, I run as usually with `netstat -rnv`. This one tells you your gateway, how your traffic is flowing.
      - `tcpdump`: it actually traces every single transactions that are leaving your machine and coming into your machine. run `tcpdump -i enp0s3`. You'll see every listening coming in, coming, going out.
## NIC Information (ethtool)
- `NIC` is  network interface card. That is something that is attaches to your computer, your desktop or your laptop. If you look at the back of your laptop, you will see that little port where you connect the ethernet five or six, cat five or six cable to it.
- ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/28b37738-4201-413c-ae1c-2f6a91c93e54)
- An example to find the information about the NIC is that you run a command ethtool followed by the name of your NIC `ethtool enp0s3`.
- How do you find out the information about your NIC? You run the command `ifconfig` that will give you all the interfaces off your computer.
- Other NICs:
  - `enp0s3` which is the one that is used to communicate to other computers or outside world, and it has the IP assigned
  - `lo` = Lo stands for loopback device is a special interface that your computer uses to communicate within itself. It works as a diagnostic and troubleshooting and to connect servers running on the local machine. Using the command `ethtool lo`
  - `virb0` = This stands for virtual bridge zero interface is used for NAT. NAT stands for network address translation. The virtual environment sometimes use it to connect to outside network. Using the command `ethtool virb0`
## NIC or Port Bonding

## New Network Utilities (nmtui, nmcli, nm-connection-editor and GNOME Settings)
## Downloading Files or Apps (get)
## curl and ping commands

