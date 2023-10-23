# CAN_Protocol

![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/c0cd741f-0857-4ab1-8aac-c9ca17a8961d)


![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/9701b95a-3d73-4d04-98d1-bd6873ee2e29)

- It’s a broadcast type of Bus(Unlike a traditional network such as USB or Ethernet,or i2c, CAN does not send data point-to-point from node A to node B under the supervision of a central bus master )
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/80231ad7-5565-42b0-ba74-0b27da0e6703)
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/32872db5-0a68-404c-96de-1261da8df31d)



![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/4404553d-d9c5-4d8d-98df-6a694a5d1e99)

![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/35a14365-76cf-429d-a901-73d62080c3d3)
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/a9047686-ebd3-4f18-b5b4-aee3a6575e3f)
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/e8fc785f-8154-4672-bdc7-54f3a420ecd2)
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/a5beb4f3-717c-44f5-a57d-851a757534bd)
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/c7903559-e194-4e91-a2a4-4f01cc1183dc)

- When receiver receives a message and it automatically calculates the CRC and then it matches that CRC with a CRC sent by the transmitter and if everything is fine.
- If Transmitter sees recessive state at the ACK slot , then it retransmits the message until it sees dominant state. That’s the reason when there is only one node on the bus, transmitter keep sending the same message since no one is there to ack it.
- The remote frame is similar to the data frame, with two important differences. First, this type of message is explicitly marked as a remote frame by a recessive RTR bit in the arbitration field, and secondly, there is no data.
### Understanding CAN bit wise arbitration
![image](https://github.com/hieunguyen0202/CAN_Protocol/assets/98166568/a02e1779-777b-4a10-82db-552501fb377e)
-So, closely observe here, NODE-2 loses arbitration here because it is trying to put the recessive bit OK. But NODE-1 and NODE-3 are putting dominant bit, so that's why NODE-2 goes out of arbitration.
- And remember that all these arbitration will happen automatically by the controller itself.

## STM32 bxCAN
https://www.vector.com/int/en/products/products-a-z/software/canoe/simulation/#


