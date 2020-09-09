from https://github.com/chassing/linux-sysadmin-interview-questions

**Simple Linux Questions**

What is the name and the UID of the administrator user?
```
UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. UIDs are stored in the /etc/passwd file
Groups in Linux are defined by GIDs (group IDs)
```

How to list all files, including hidden ones, in a directory?
```
ls -a (--all  -> do not ignore entries starting with . )
```

What is the Unix/Linux command to remove a directory and its contents?
```
rmdir - only empty directories
rm -rf dir
```

Which command will show you free/used memory? Does free memory exist on Linux?
```
free -m
Free memory does exist on linux
```

How to search for the string "my konfu is the best" in files of a directory recursively?
```
grep -liR "my konfu is the best" /
```

How to connect to a remote server or what is SSH?
```
ssh root@192.168.10.8
Secure Shell is a software standard to support encrypted data transfer between two computers. It can be used to support secure logins, file transfers or general purpose connects.
```

How to get all environment variables and how can you use them?
```
printenv - print all or part of environment
```

I get "command not found" when I run ifconfig -a. What can be wrong?
```
net-tools is not installed
```

What happens if I type TAB-TAB?
```
the shell will automatically fill in the rest or show you the available options you can type (tab completion)
```

What command will show the available disk space on the Unix/Linux system?
```
df -h
df - report file system disk space usage
```

What commands do you know that can be used to check DNS records?
```
dig ( dig [server] [name] [type] ; dig hostinger.in MX )
nsloockup ( nslookup -type=ns example.com )
host (host -t ns google.com)
```

What Unix/Linux commands will alter a files ownership, files permissions?
```
chown - change file owner and group
chmod - change file mode bits
```

What does chmod +x FILENAME do?
```
make it executable
```

What does the permission 0750 on a file mean?
```
0750 - owner=Read,Write,Execute - group=Read,Execute - other=No Permission
```

What does the permission 0750 on a directory mean?
```
0750 - owner=Read,Write,Open - group=Read,Open - other=No Permission
The directory owner has full access. Group users may list the directory, but cannot create files. Nobody else has any rights.
```

How to add a new system user without login permissions?
```
useradd -r username ( the -r flag will create a system user - one which does not have a password, a home dir and is unable to login )
---
useradd -M username ( Do no create the user's home directory )
usermod -L username ( lock the account to prevent logging in )
```


How to add/remove a group from a user?
```
usermod -a -G group user ( adding a user to a group )
gpasswd -a user group
---
gpasswd -d user group
deluser user group
usermod -G "" username ( removes all secondary/supplementary groups from username )
```

What is a bash alias?
```
An alias is a (usually short) name that the shell translates into another (usually longer) name or command
```

How do you set the mail address of the root/a user?
```

P.S. for postfix: set in main.cf => myhostname = host.example.com
```

What does CTRL-c do?
```
Control+C is used to kill a process with the signal SIGINT, and can be intercepted by a program so it can clean its self up before exiting, or not exit at all
```

What does CTRL-d do?
```
Ctrl-D tells the terminal that it should register a EOF on standard input, which bash interprets as a desire to exit
```

What does CTRL-z do?
```
Control+Z is used for suspending a process by sending it the signal SIGSTOP, which cannot be intercepted by the program.
```

What is in /etc/services?
```
/etc/services file contains a list of network services and ports mapped to them.
```

How to redirect STDOUT and STDERR in bash? (> /dev/null 2>&1)
```
command > file-name 2>&1
ls /tmp > /dev/null 2>&1
```

What is the difference between UNIX and Linux.
```
Linux is not Unix, but it is a Unix-like operating system. Linux system is derived from Unix and it is a continuation of the basis of Unix design. Linux distributions are the most famous and healthiest example of the direct Unix derivatives. BSD (Berkley Software Distribution) is also an example of a Unix derivative.
```

What is the difference between Telnet and SSH?
```
The key difference between Telnet and SSH is that SSH uses encryption, which means that all data transmitted over a network is secure from eavesdropping.
```

Explain the three load averages and what do they indicate. What command can be used to view the load averages?
```
Load average – is the average system load calculated over a given period of time of 1, 5 and 15 minutes.
uptime, w, top*
cat /proc/loadavg
```

Can you name a lower-case letter that is not a valid option for GNU ls?
```
option 'y'
option 'z'
```

What is a Linux kernel module?
```
Kernel modules are pieces of code that can be loaded and unloaded into the kernel upon demand. They extend the functionality of the kernel without the need to reboot the system.
```

Walk me through the steps in booting into single user mode to troubleshoot a problem.
```
It is runlevel 1 under system SysV init, and runlevel1.target or rescue.target in systemd.
telinit 1
GRUB => 'e' => rw init=/sysroot/bin/sh => 'Ctrl-X' => chroot /sysroot/
#https://www.tecmint.com/boot-into-single-user-mode-in-centos-7/
```

Walk me through the steps you'd take to troubleshoot a 404 error on a web application you administer.
```
check files location
check files permissions
check server free space
check web-server service
etc...
```

What is ICMP protocol? Why do you need to use?
```
ICMP is a protocol for sending various messages to report network conditions.
ICMP is used by a device, like a router, to communicate with the source of a data packet about transmission issues. For example, if a datagram is not delivered, ICMP might report this back to the host with details to help discern where the transmission went wrong. It's a protocol that believes in direct communication in the workplace.
Ping is a utility which uses ICMP messages to report back information on network connectivity and the speed of data relay between a host and a destination computer. It's one of the few instances where a user can interact directly with ICMP, which typically only functions to allow networked computers to communicate with one another automatically.
```
