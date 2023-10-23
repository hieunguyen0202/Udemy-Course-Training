#### Complete Linux Training Course to Get Your Dream IT Job 2023
https://bosch-bgsv.udemy.com/course/complete-linux-training-course-to-get-your-dream-it-job/learn/lecture/9165636#overview
#### https://www.geeksforgeeks.org/how-linux-kernel-boots/
- SHELL is a program which provides the interface between the user and an operating system. When the user logs in OS starts a shell for user.
-  Scripts written for the sh shell are called shell scripts
```
Example shell scripts:
#!/bin/sh
x=10
y=11
if [ $x -ne $y ] 
then
echo "Not equal"
fi
```
-  Bash is generally the default shell in most of the Linux Distributions and scripts written specifically for bash shell are called bash scripts.
```
Example bash scripts:
#!/bin/bash

VAR_1="Devil"
VAR_2="OWL"

echo "$VAR_1$VAR_2"
```
- Search for [Type of shell](https://www.geeksforgeeks.org/different-shells-in-linux/).
- Learn more [Bash/Shell scripts](https://www.geeksforgeeks.org/how-to-create-a-shell-script-in-linux/)

# Linux Kernel
#### [Linux Kernel](https://github.com/markdown-it/markdown-it-emoji)
- The kernel is the core component of an operating system. This provides a platform for programs and various services to run on top of it.
- we need a middle layer to manage the distribution of the computer’s hardware resources efficiently and fairly among all the various processes running on the computer. This middle layer is referred to as the kernel. The kernel virtualizes the computer’s common hardware resources to provide each process with its own virtual resources.
- The kernel is also responsible for preventing and mitigating conflicts between different processes.
- Some Basic Commands we need to know while working on Linux Kernel. Eg. `ls`, `cd`,`pwd`...
- Kernel is central component of an operating system that manages operations of computer and hardware.
- Kernel loads first into memory when an operating system is loaded and remains into memory until operating system is shut down again
- Kernel has a process table that keeps track of all active processes
#### The Core Subsystems of the Linux Kernel are as follows:
- The Process : This kernel subsystem is responsible for fairly distributing the CPU time among all the processes running on the system simultaneously.
- The Memory Management Unit (MMU): This kernel sub-unit is responsible for proper distribution of the memory resources among the various processes running on the system. The MMU does more than just simply provide separate virtual address spaces for each of the processes.
- The Virtual File System (VFS): This subsystem is responsible for providing a unified interface to access stored data across different filesystems and physical storage media.
#### Objectives of Kernel : 
- To establish communication between user level application and hardware. 
- To decide state of incoming processes.  
- To control disk management.  
- To control memory management. 
- To control task management.
#### How Linux Kernel Boots?
##### Stages of Linux Boot Process:
- The machine’s BIOS (Basic Input/Output System) or boot microcode hundreds and runs a boot loader.
- Boot loader finds the kernel image on the disk and loads it into memory, to start the system.
- The kernel initializes the devices and their drivers.
- The kernel mounts the basis filesystem.
- The kernel starts a program referred to as init with a method ID zero
- init sets the remainder of the system processes in motion.
- For some purpose, init starts a method permitting you to log in, typically at the top or close to the top of the boot sequence.
#### [Boot Loader](https://github.com/markdown-it/markdown-it-emoji)
##### Boot Loader Tasks:
- Select from multiple kernels.
- Switch between sets of kernel parameters.
- Provide support for booting different operating systems.
###### 1) GRUB:
- GRUB stands for Grand Unified Boot Loader. One of GRUB’s most vital capabilities is filesystem navigation that enables straightforward kernel image and configuration choice.
- Upon finding the boot code, the BIOS hundreds and executes it. This is often wherever GRUB begins.
- The GRUB core hundreds.
- The core initializes. At now, GRUB will currently access disks and filesystems.
- GRUB identifies its boot partition and hundreds of configurations there.
- GRUB offers the user an opportunity to vary the configuration.
- GRUB executes the configuration after a timeout or user action.
- In the course of execution of the configuration, GRUB might load further code within the boot partition. a number of these modules are also preloaded.
- To load and execute the kernel GRUB executes boot commands.
###### 2) LILO (LInux LOader):
It was the first bootloader developed for Linux, still some users use it today. If we compare it to the GRUB bootloader it is quite simple and primarily used with BIOS system. To install it on Linux system one can install it using package manager like apt or yum. After installation it can be easily configured by editing its configuration file located at `/etc/lolo.conf`.
###### 3) SYSLINUX:
It is lightest among other bootloaders; it can perform booting from removable media such as CDs or USB drives. Its key feature is that it supports different filesystems, a command-line interface and the ability to boot from multiple devices.  For example, to install SYSLINUX on a USB drive we can configure SYSLINUX setting by editing its configuration file located in `/syslinux/syslinux.cfg`.
#### [Difference between Operating System and Kernel](https://github.com/markdown-it/markdown-it-emoji)
###### Operating System: 
- It is a system program that provides interface between user and computer. When computer boots up Operating System is the first program that loads.
- Operating System provides interface between user and hardware.
- It also provides protection and security.
- An operating system is a complete software package that includes a kernel and other system-level components such as device drivers, system libraries, and utilities.
- The operating system provides a higher-level interface to the user, such as the GUI, command-line interface, and file system.
- All system needs operating system to run.
- It is the first program to load when computer boots up.
- Type of operating system includes single and multiuser OS, multiprocessor OS, Realtime OS, Distributed OS.

###### Kernel: 
- A kernel is the core component of an operating system. It is also a system program. It is the part of Operating System which converts user commands into machine language.
- Kernel provides interface between applications and hardware.
- It’s main purpose is memory management, disk management, process management and task management.
- The kernel, on the other hand, is the core of the operating system that manages system resources, such as the CPU, memory, and I/O devices.
- The operating system provides a higher-level interface to the user, such as the GUI, command-line interface, and file system.
- All operating systems need kernel to run.
- It is the first program to load when operating system loads.
- Type of kernel includes Monolithic and Micro kernel.

# Processes in Linux/Unix
- A program/command when executed, a special instance is provided by the system to the process. This instance consists of all the services/resources that may be utilized by the process under execution.
- Whenever a command is issued in Unix/Linux, it creates/starts a new process. For example, pwd when issued which is used to list the current directory location the user is in, a process starts.
- Through a 5 digit ID number Unix/Linux keeps an account of the processes, this number is called process ID or PID. Each process in the system has a unique PID.
- At any point of time, no two processes with the same pid exist in the system because it is the pid that Unix uses to track each process.
#### [Initializing a process](https://github.com/markdown-it/markdown-it-emoji)
##### A process can be run in two ways:  
- Method 1: Foreground Process : Every process when started runs in foreground by default, receives input from the keyboard, and sends output to the screen.  When issuing pwd command
```
$ ls pwd
# When a command/process is running in the foreground and is taking a lot of time, no other processes can be run or started because the prompt would not be available until the program finishes processing and comes out. 
```
- Method 2: Background Process: It runs in the background without keyboard input and waits till keyboard input is required. Thus, other processes can be done in parallel with the process running in the background since they do not have to wait for the previous process to be completed. 
Adding & along with the command starts it as a background process
```
 $ pwd &
```
#### [Tracking ongoing processes](https://github.com/markdown-it/markdown-it-emoji)
- ps (Process status) can be used to see/list all the running processes.
```
$ ps
```
- For more information -f (full) can be used along with ps

```
$ ps –f
```

- For single-process information, ps along with process id is used
```
$ ps 19
```
- top: This command is used to show all the running processes within the working environment of Linux. 
Syntax:
```
top
```
- nice: It starts a new process (job) and assigns it a priority (nice) value at the same time. 
Syntax:
```
nice [-nice value]
#nice value ranges from -20 to 19, where -20 is of the highest priority. 
```
- renice : To change the priority of an already running process renice is used. 
Syntax:
```
renice [-nice value] [process id]
```
df: It shows the amount of available disk space being used by file systems 
Syntax:  
```
df
```
- free: It shows the total amount of free and used physical and swap memory in the system, as well as the buffers used by the kernel
```
free
```
#### [Types of Processes](https://github.com/markdown-it/markdown-it-emoji)
#### 1. Parent and Child process :
The 2nd and 3rd column of the ps –f command shows process id and parent’s process id number. For each user process, there’s a parent process in the system, with most of the commands having shell as their parent.
#### 2.Orphan process : 
But at times when the parent process is killed before the termination of the child process, the child processes become orphan processes.
#### 3.Daemon process : 
They are system-related background processes that often run with the permissions of root and services requests from other processes, they most of the time run in the background and wait for processes it can work along with for ex print daemon. 
# Linux Administrator System
#### [What is Linux System Administration?](https://github.com/markdown-it/markdown-it-emoji)
- The main advantage of Linux is that it is distributed under an open-source license, which means programmers can use the Linux Kernel to design their own custom operating systems.
- Most Linux code is written in C Programming Language.
- Some of the most popular operating systems that use Linux as a kernel are Debian, Knoppix, Ubuntu, and Fedora.
- Linux is a major strength in computing technology. Most web servers, mobile phones, personal computers, supercomputers, and cloud servers are powered by Linux. The job of a Linux systems administrator is to manage the operations of a computer system like maintaining, enhancing, creating user accounts/reports, and taking backups using Linux tools and command-line interface tools. Most computing devices are powered by Linux because of its high stability, high security, and open-source environment.
#### [Linux System Administration](https://github.com/markdown-it/markdown-it-emoji)
#### Linux File Systems
- Understanding the difference between these file systems is important so that one can easily perform tasks and partition disks or configure Linux file system permissions.
- The Linux File System Hierarchy (FHS) tells us about the location and structure of directories and files on a Linux system. It is important for managing system files effectively.
#### Managing Root/Super User
- The root user is the most powerful user on a Linux System because it has access to all the system files and directories. So, it is important for maintaining system security.
- The default shell of Linux is Bash, and it is used for executing commands on the command-line interface. A Linux system administrator should have a basic understanding of the command of bash to perform tasks.
- Managing files, directories and users is a critical part of Linux system administration. A system administrator should be able to perform the basic file and directory management tasks.
#### Duties of a Linux Administrator
- Maintain all internet requests inclusive to DNS, RADIUS, Apache, MySQL, PHP.
- Taking regular back up of data, create new stored procedures and listing back-up is one of the duties.
- Analyzing all error logs and fixing along with providing excellent customer support for Webhosting, ISP and LAN Customers on troubleshooting increased support troubles.
- Communicating with the staff, vendors, and customers in a cultivated, professional manner at all times has to be one of his characteristics.
- Enhance, maintain and create the tools for the Linux environment and its users.
- Detecting and solving the service problems ranging from disaster recovery to login problems.
- Installing the necessary systems and security tools. Working with the Data Network Engineer and other personnel/departments to analyze hardware requirements and makes acquiring recommendations.
- Troubleshoot, when a problem occurs in the server.
#### Managing Users and Group in Linux
- To learn more about how to manage users read [the article](https://www.geeksforgeeks.org/user-management-in-linux/).
- To learn more about how to manage groups read [the article](https://www.geeksforgeeks.org/group-management-in-linux/).


