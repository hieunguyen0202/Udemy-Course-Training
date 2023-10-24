# Tutorials
## Linux File Editor (vi)
- `vi` - visual editor
- `i`: insert
- `ESC`: Escape any of code
- `r`: replace, (ESC->move cursor before the character which you want to replace-> Type `r`-> new charater)
- `:q!`: without saving
- `:wq!` or `shift + Z + Z`: Exit and saving
## "sed" Command
- Replace a string  in a file with a newstring
    ```
    sed 's/<oldWord>/<newWord>/g' file
   # g: replace entire the file
    sed -i 's/<oldWord>/<newWord>/g' file
    ```
- Remove the string from file
    ```
    sed 's/<removeWord>//g' file
    sed -i 's/<removeWord>//g' file
    ```
    
- Find and delete a line has this `string`
  ```
    sed '/<string>/d' test
    sed -i '/<string>/d' test
    ```
- Remove empty lines
    ```
    sed '/^$/d' test
    sed -i '/^$/d' test
    ```
- Remove the first or n lines in a file
  ```
    # Remove the first line
    sed '1d' test
    # Remove the first two line
    sed -i '1,2d' test
    ```
- To replace tabs with spaces
    ```
    # Not change
    sed 's/\t/ /g' test
    # Change real
    sed -i 's/\t/ /g' test
    # Tab
    sed -i 's/ /\t/g' test
    ```
- Show defined lines from a file
  ```
    sed -n 3,5p test
  # All from the top except 3-5 last line
      sed 3,5d test

    ```
- Enter space every line
  ```
    sed G test
    sed -i G test
    ```
- Substitute within `vi` editor
## User Account Management (useradd, groupadd, usermod, userdel, groupdel)
- File 
    - /etc/passwd
    - /etc/group
    - /etc/shadow
- Commands
    - useradd:
      ```
      // User root dỉrectory
      su -
      // Enter password
      useradd newNameUser
      // check ID user
      id newNameUser
      // Check user
      cd /home/
      ls -l
      ls -ltr      
      ```
   - groupadd:
     ```
     groupadd newNameGroup
     // check
     cat /etc/group
     ```
  - userdel:
     ```
     userdel -r oldUserName
     // check
     ls -ltr
     ```
  - groupdel:
     ```
     groupdel oldGroupName
     // check
     cat /etc/group
     ```
  - usermod: this command is used to modify the user
     ```
     // Assign the group for user
     usermod -G oldGroupName oldUsername
     // check
     grep oldUsername /etc/group
     // Change actual group for user
     chgrp -R oldGroupName oldUsername
     // Check
     ls -ltr
     ```
  - Description of /etc/passwd
    ```
    <NameOfUser>:<Password>:<UserID>:<GroupID>::<HomeDirectory>:/bin/bash
    ```
  - Get information for detailed user
    ```
    grep UserName /etc/passwd
    ```
  - Create all
    ```
    useradd -g GroupName -s  /bin/bash -c "Description of group" -m -d  /home/UserName UserName
    // Check
    id UserName
    ```
  - Create password for new user
    ```
    passwd UserName
    // Enter new Password
    // Retype Password again
    
    ```
## Enable Password Aging
That file is actually controls how the passwords age minimum maximun is set for each user

![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/b994ddbb-7d5e-4b55-9b96-029c0d42901f)

```
whoami
more /etc/login.defs
useradd TestUser
grep Test /etc/shadow
chage -m 5 -M 90  -W 10 -I 3 -E
```
## Switch Users and Sudo Access (su, sudo)
- `su - username`: switch from one user to another
  Example: 
  ```
  ifconfig
  // check IP and using Putty to access user
  whoami
  //Example: oldUser
  su - NewUser
  exit
  // Change root
  su -
  //Example: root
  ```
- `sudo command`: If you do not have root privileges
  Example:
  ```
  // Instead switch root to run the command that has `Permission denied`
  su -
  visudo
  // We use the `sudo command`
  sudo visudo
  ```
- `visudo`: edits the etc sudo or file which is a configiration file th at allow user to add or remove the rights to run the certain commands.
- File : `/etc/sudoers`
## Monitor Users (who, last, w, id)
- `who`: tell you how many people logged into the system
- `last`: tell you all the detail of every user that have been logged in
  ```
  last
  // The last time, the user logged in 
  last | more
  last | awk '{print $1}'
  // remove the duplicate
  last | awk '{print $1}' | sort | uniq
  // Other
  w
  id
  id userName
  // Help
  man who
  ```
## Talking to Users (users, wall, write)
- `users`: To see how many users logged into the system
- `wall`: is the command that is broadcast your message to everyone who is logged into the Linux System
- `write`: is dedicated to a user. It's just one user to another
- Example
  ```
  // Using Putty and login
  ifconfig | more
  users
  ```
  Another command line
  ```
  wall
  PLease logoff, this system is coming down for maintenance
  PLease press `Ctrl + D` to exit
  ```
  So, the other terminal will show the same message
  ```
  // To tell the specific user
  write <NameUser>
  Hi NameUser, please stop the logged into the system
  --Press `Ctrl + D`
  ```
## Linux Directory Service - Account Authentication
## System Utility Commands (date, uptime, hostname, uname, which, cal, bc)
  - `date`
  - `uptime`:
  - `hostname`
  - `uname` | `uname -a`
  - `which` : Tell you the location of your command that you run
    ```
    which pwd
    ls -l /usr/bin/pwd
    // To see how many command in your linux system
    ls -l | wc -l
    ```
  - `cal`: give the calendar
    ```
    // cal <month> <year>
    cal 9 1997
    cal 1996
    ```
  - `bc`: show caculator on the terminal
    ```
    bc
    using `quit` to exit
    ``` 
    ## Processes, Jobs and Scheduling
    - `Process`: when you run an application or when you start up an application, it actually generate process
    - `Thread`: Every process could have multiple threads
    - `job`: is something that is created by scheduler, like Workorder to run those application and services
    Process/ Services Commands
    - `systemctl` or `service`
      ```
      systemctl start|stop|status servicename.service
      systemctl enable|disable servicename.service
      systemctl restart|reload servicename.service
      systemctl list-units --all
      ```
      - To add a service under systemctl management
        Create a unit file in `/etc/systemd/system/servicename.service
      - To control system with systemctl
         - `systemctl poweroff`
         - `systemctl halt`
         - `systemctl reboot`
    - `ps`: to see what processes running in your linux system
      ```
      So an example would be by just running the ps command, which will show you the processes of the current shell.
      PID = the unique process ID
      TTY = terminal type that the user logged-in to
      TIME = amount of CPU in minutes and seconds that the  process has been running
      CMD = name of the command
      ```
      - `ps -e`: Shows all running processes
      - `ps aux`: Shows all runnning processes in BSD (Berkeley Systems Description) format
      - `ps -ef`: Shows all running processes in full format listing (Most common used)
      - `ps -u` <username> = Shows all processes by username
      - `ps -ef | grep <NameofProcess>`
  
    - `top`: See all your process running in your system depeding on which  process you want to see first, CPU, memory information
      ```
      Top command is used to show the Linux processes and it provides a real time view of the running system.
      This command shows the summary information of the system and the list of processes or threads which are currently managed by the Linux kernel.
      Now, when you run the top command or when it is executed, it actually goes into an interactive mode and you could run a commands within that interactive mode.
      Now, if you want to get out of that interactive mode, then you have to hit `Q` on your keyboard to get out of it.
      ```
      Example
      ```
      whoami
      pwd
      hostname
      top
      //exit
      press q
      ```
      - `PID`: Show task's unique process id
      - `USER`: Username of owner of task
      - `PR`: The PR field shows the scheduling priority of the process from the perspective of the kernel
      - `NI`: Represents a Nice Value of task. A `negative` nice implies higher priority, and `positive` nice means lower priority
      - `VIRT`: Total virtual memory used by the task
      - `RES`: Memory consumed by the process in RAm
      - `SHR`: Represents the amounts of shared memory used by a task
      - `S`: Thi sfield shows the process state in the single-letter form
      - `%CPU`: Represent the CPU usage
      - `%MEM`: Shows the memory usage of task
      - `TIME+`: CPU time, the same as `TIME`, but reflecting more graularity through hundredths of a second
      - `COMMAND LINE`:
         - `top -u <userName>`:  shows tasks/processes by user owned
         - `top then press c`: shows commands absolute path
         - `top then press k`: kill a process by PID within top session
         - `top then M and P`: To sort all Linux running processes by Memory usage
         - `Please note`: Top command refreshes the information every 3 seconds
    - `kill`: kill the process name or kills by the process id
      - Kill command is used to terminate processes manually
      - It sends a signal ultimately terminates or kills a particular process or group of processes
      - Usage: `kill [OPTION] [PID]
      - `OPTION`: Signal name or signal number/ID
      - `PID`: Process ID
      - `kill -l`: to get a list of all signal names or signal number
      - `kill [PID]`(mostly use): Kil a process with default signal
      - `kill -1 [PID]`: Restart
      - `kill -2 [PID]`: Interrupt from the keyboard just like Ctrl C 
      - `kill -9 [PID]`: Forcefully kill the process
      - `Tip`: Using `top` or `ps -ef` to list a process ID
      - Example:
        ```
            // Open new terminal and type this command
                sleep 50
            //Open other terminal
                ps -ef | grep sleep
            // kill this process, given that: 655 is PID of sleep's process
                kill -9 655
        ```
       - Other similar kill commands are:
            - `killall`: This is going to kill all the process
            - `pkill`: Pkill allows you to kill by the process name. So let's say if you do not have a process ID, then you could actually simply use pkill to kill a process by its name.
    - `crontab`: is used to schedule these application or these process or services for you in your system
      - You run certain commands almost every day, at the same time to do the same thing. So why not use the crontab?
      - Some common command:
         - `crontab -e` =  Edit the crontab
         - `crontab -l` = List the crontab entries
         - `crontab -r` = Remove the crontab
         - `crond`(little use):
         - `systemctl status crond` = To manage/check the crond service
         - ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/0f385eef-02a3-457d-ad25-77167786ca27)
         - Example:
           ```
           // check date
           date
           // Example
           crontab -e
           21(minutes) 16(hour) *(every day) 10(month) *(fullDay) echo "This is my first command" > first-crontab
           21 16 * 10 * echo "This is my first command" > first-crontab
           // To see content in edit crontab 
           crontab -l
           // Waiting for given time, this command `echo "This is my first command" > first-crontab` will be executed
           // To remove
           crontab -r
           ```

    - `at`: At command is like crontab, which allows you to schedule jobs. 
       - When the command is run, it will enter interactive mode, and you could get out of that mode by pressing the control D.
       - Usage:
         - `at HH:MM PM` = Schedule job
         - `atq` = List the at entries
         - `atrm <index of entries>` or `atrm #`: Remove one or all entries
         - `systemctl status atd`= To mamage the atd service
         - Example: Run this command `at 4:45PM` and hit ENTER, type `echo "This is my first" > at-entry`, finally hit `Ctrl D` to exit
         - Others:
         - ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/f83edb8d-abd4-4a83-8533-51aeee608e3f)
## Additional cronjobs (hourly, daily, weekly, monthly)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/8f6ab69c-4216-4fcf-9c57-db26e6ae1daa)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/8b3251ee-7131-4b3b-9f7d-c4a4ced3166d)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/09c98be3-75a8-41d5-b9fc-691cc42a2d03)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/8bd2a69e-760f-402b-a74c-5464f521e978)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/8dbc454c-0e27-41d9-9375-f41a138382bf)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/1cdf56a6-eceb-430c-828f-c6af931ffa24)
## Process Management (bg, fg, nice)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/0158aa0d-99fd-4400-9cce-ebc6c2aafd43)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/6ce2a561-fc68-4b00-9e2e-37af2e56baad)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/e395a5ef-d8c2-4a4f-95c7-85cfcee60a2c)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/7ca2350c-570d-4a26-bc20-1819e16ff624)
Now how do we run a process without interrupting the process when we close our terminal?
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/5620733d-db3c-41ef-a81c-834f4df7d4bb)
             
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c3e234e2-ddf2-476a-81e4-8c5cca88084a)
  
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/778a941c-f2b7-4ba5-81fd-3d452bee6154)
"Hey CPU I have this process - 'sleep 10' and please give this process priority 5, which is not too high, which is not too low". It will get tell that to the CPU and CPU will process that according to the command of "nice".
## System Monitoring Commands (df, dmesg, iostat 1, netstat, free, top)
