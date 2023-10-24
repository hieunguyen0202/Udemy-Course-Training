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
    - `kill`: kill the process name or kills by the process id
    - `crontab`: is used to schedule these application or these process or services for you in your system
    - `at`: just like `crontab`
    
  
  
