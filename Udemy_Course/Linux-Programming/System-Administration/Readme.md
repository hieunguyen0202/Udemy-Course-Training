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
- `last': tell you all the detail of every user that have been logged in
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

