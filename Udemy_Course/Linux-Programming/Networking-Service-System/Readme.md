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
