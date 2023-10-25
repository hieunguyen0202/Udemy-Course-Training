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
- NIC bonding is one of the very important and critical aspect in Linux network configuration, and these type of questions are asked oftentimes in an interview.
- ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bf4665c0-321d-4954-8b02-812b03ae8b3f)
- We have these four NIC cards on our computer. So what we do with NIC bonding is we take two ports, we combine them together, and the reason we combine them is because what if one port dies? We still have another port. So this is for the `redundancy`.
- So another way to make two ports redundant, or to have them high availability, is you combine them together. If a port is one gig, and the other port is one gig,
 you combine them together to aggregate them and get the throughput of two gig. This is achieved for high availability and link `aggregation`.
- Some command:
    - `modprobe bonding`:
    - `modinfo bonding`:
    - Create `/etc/sysconfig/network-scripts/ifcfg-bond0`
    - Edit `/etc/sysconfig/network-scripts/ethernet1`:
    - Edit `/etc/sysconfig/network-scripts/ethernet2`:
    - ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/1b78eb60-ad1d-4e1a-aa07-c37d62c5be01)
    - Restart newwork = `systemctl restart network`
- Step 1: Click on `Snapshots`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/5b054852-16fb-4283-b6ce-c964a8017d74)
- Step 2: Click on `take`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/7bb86e4a-79c5-4653-bca7-17ddd264d36a)
- Step 3: Click on `ok`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/1dc30ecd-f3e2-4c6f-810d-56c2e671da16)
- Step 4: Click on `Settings`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/99ad873b-d953-4adc-b342-7337cb958be3)
- Step 5: Go to `Network`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c16a2392-bce4-47cb-af9a-faf4c3735719)
- Step 6: Click on `Adapter 2`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/74d52ba5-13bc-4118-972e-69fc159d24c8)
- Step 7: Select information that is the same in this picture
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/f4b4b002-23ef-47cf-993b-6d7882605270)
Now we will have two NICs on our computer, which is one here, Adapter 1, and Adapter 2. If you want more adapters, you could go to Adapter 3 and 4 and check on Enable Network Adapter.
- Step 8: Click on `OK`
- Step 9: Click on `Start`
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/2f3b9811-49aa-444b-9c45-ea41df9b1783)
After that, run command `ifconfig | more`, you will see like a picture:
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/041cc4ba-f3de-456a-abea-242d989c2308)
Now we have two network interfaces. One is `enp0s3`, and the second one is `enp0s8`. `enp0s8` is the one that we just added through our Oracle Virtual Box. Now what we want to do is we want to combine these two, 3 and 8, together, and make a bond out of these two interfaces.
- Step 10: open terminal
    ```
    su -
    modprobe bonding | more
    ```
    ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/8b223e9c-85fa-4c7c-a1a2-d0a4d4073b6c)
`Ethernet Channel Bonding Driver v3.7.1`, that means you already have the driver installed, which is the modprobe in Linux, so you don't have to worry about installing it.
    ```
    vi /etc/sysconfig/network-scripts/ifcfg-bond0
    ```
    And typing exactly the picture:
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/58504051-9988-4c53-b4ef-48d43865b4ef)
    ```
    cd /etc/sysconfig
    cd network-scripts/
    vi ifcfg-enp0s3
    ```
    When the interactive mode is show, you delete all the conetent and retype the same content in picture below (`HWADDR` get this information from `ifconfig | more`)
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/704e13be-9d1f-41a6-8a50-bff1cddca343)


## NIC or Port Bonding

## New Network Utilities (nmtui, nmcli, nm-connection-editor and GNOME Settings)
## Downloading Files or Apps (get)
## curl and ping commands

