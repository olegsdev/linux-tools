From [Linux System Administrator/DevOps Interview Questions](https://github.com/chassing/linux-sysadmin-interview-questions)


## Simple Linux Questions

**What is the name and the UID of the administrator user?**

> **root** 

> UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. UIDs are stored in the /etc/passwd file
Groups in Linux are defined by GIDs (group IDs)


**How to list all files, including hidden ones, in a directory?**
```
ls --all  - do not ignore entries starting with .  (-a)
```

**What is the Unix/Linux command to remove a directory and its contents?**
```
rmdir - only empty directories
rm -rf dir
```

**Which command will show you free/used memory? Does free memory exist on Linux?**
```
free -m
Free memory does exist on linux
```

**How to search for the string "my konfu is the best" in files of a directory recursively?**
```
grep -liR "my konfu is the best" 
```

**How to connect to a remote server or what is SSH?**
```
ssh user@server
```
> Secure Shell is a software standard to support encrypted data transfer between two computers. It can be used to support secure logins, file transfers or general purpose connects.


**How to get all environment variables and how can you use them?**
```
printenv - print all or part of environment
```

**I get "command not found" when I run ifconfig -a. What can be wrong?**
```
net-tools is not installed
```

**What happens if I type TAB-TAB?**

> the shell will automatically fill in the rest or show you the available options you can type (tab completion)


**What command will show the available disk space on the Unix/Linux system?**
```
df -h
df - report file system disk space usage
```

**What commands do you know that can be used to check DNS records?**
```
dig ( dig [server] [name] [type] ; dig example.com MX )
nsloockup ( nslookup -type=ns example.com )
host (host -t ns example.com)
```

**What Unix/Linux commands will alter a files ownership, files permissions?**
```
chown - change file owner and group
chmod - change file mode bits
```

**What does chmod +x FILENAME do?**
```
make it executable
```

**What does the permission 0750 on a file mean?**
```
0750 - owner=Read,Write,Execute - group=Read,Execute - other=No Permission
```

**What does the permission 0750 on a directory mean?**
```
0750 - owner=Read,Write,Open - group=Read,Open - other=No Permission
```
> The directory owner has full access. Group users may list the directory, but cannot create files. Nobody else has any rights.


**How to add a new system user without login permissions?**
```
useradd -r username 
```
> the -r flag will create a system user - one which does not have a password, a home dir and is unable to login )
```
useradd -M username ( Do no create the user's home directory )
usermod -L username ( lock the account to prevent logging in )
```


**How to add/remove a group from a user?**
```
usermod -a -G group user ( adding a user to a group )
gpasswd -a user group
---
gpasswd -d user group
deluser user group
usermod -G "" username ( removes all secondary/supplementary groups from username )
```

**What is a bash alias?**

> An alias is a (usually short) name that the shell translates into another (usually longer) name or command


**How do you set the mail address of the root/a user?**
```
/root/.forwards
/etc/aliases
P.S. for postfix: set in main.cf => myhostname = host.example.com
```

**What does CTRL-c do?**

> CTRL+C is used to kill a process with the signal SIGINT, and can be intercepted by a program so it can clean its self up before exiting, or not exit at all


**What does CTRL-d do?**

> Ctrl-D tells the terminal that it should register a EOF on standard input, which bash interprets as a desire to exit


**What does CTRL-z do?**

> CTRL+Z is used for suspending a process by sending it the signal SIGSTOP, which cannot be intercepted by the program.


**What is in /etc/services?**

> /etc/services file contains a list of network services and ports mapped to them.


**How to redirect STDOUT and STDERR in bash? (> /dev/null 2>&1)**
```
command > file-name 2>&1
ls /tmp > /dev/null 2>&1
```

**What is the difference between UNIX and Linux.**

> Linux is not Unix, but it is a Unix-like operating system. Linux system is derived from Unix and it is a continuation of the basis of Unix design. Linux distributions are the most famous and healthiest example of the direct Unix derivatives. BSD (Berkley Software Distribution) is also an example of a Unix derivative.


**What is the difference between Telnet and SSH?**

> The key difference between Telnet and SSH is that SSH uses encryption, which means that all data transmitted over a network is secure from eavesdropping.


**Explain the three load averages and what do they indicate. What command can be used to view the load averages?**

> Load average – is the average system load calculated over a given period of time of 1, 5 and 15 minutes.
```
uptime, w, top
cat /proc/loadavg
```

**Can you name a lower-case letter that is not a valid option for GNU ls?**
```
option 'y'
option 'z'
```

**What is a Linux kernel module?**

> Kernel modules are pieces of code that can be loaded and unloaded into the kernel upon demand. They extend the functionality of the kernel without the need to reboot the system.


**Walk me through the steps in booting into single user mode to troubleshoot a problem.**
```
It is runlevel 1 under system SysV init, and runlevel1.target or rescue.target in systemd.
telinit 1
GRUB => 'e' => rw init=/sysroot/bin/sh => 'Ctrl-X' => chroot /sysroot/
https://www.tecmint.com/boot-into-single-user-mode-in-centos-7/
```

**Walk me through the steps you'd take to troubleshoot a 404 error on a web application you administer.**
```
check files location
check files permissions
check server free space
check web-server service
logs 
etc...
```

**What is ICMP protocol? Why do you need to use?**

> ICMP is a protocol for sending various messages to report network conditions.
ICMP is used by a device, like a router, to communicate with the source of a data packet about transmission issues. For example, if a datagram is not delivered, ICMP might report this back to the host with details to help discern where the transmission went wrong. It's a protocol that believes in direct communication in the workplace.
Ping is a utility which uses ICMP messages to report back information on network connectivity and the speed of data relay between a host and a destination computer. It's one of the few instances where a user can interact directly with ICMP, which typically only functions to allow networked computers to communicate with one another automatically.



## Medium Linux Questions


**What do the following commands do and how would you use them?**
```
tee - read from standard input and write to standard output and files
awk - pattern scanning and processing language (awk '{print $1}' myfile)
tr - translate or delete characters
cut - remove sections from each line of files
tac - concatenate and print files in reverse
curl - transfer a URL
wget - The non-interactive network downloader
watch - execute a program periodically, showing output fullscreen
head - output the first part of files
tail - output the last part of files
less - opposite of more (more - file perusal filter for crt viewing)
cat - concatenate files and print on the standard output
touch - change file timestamps
sar - Collect, report, or save system activity information.
netstat - Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships
tcpdump - dump traffic on a network
lsof - list open files
```

**What does an **&** after a command do?**

With & the process starts in the background, so you can continue to use the shell.


**What does **& disown** after a command do?**

Removes the process from the shell's job control, but it still leaves it connected to the terminal.

https://unix.stackexchange.com/questions/3886/difference-between-nohup-disown-and


**What is a packet filter and how does it work?**

A packet filter is a piece of software which looks at the header of packets as they pass through, and decides the fate of the entire packet. It might decide to DROP the packet (i.e., discard the packet as if it had never received it), ACCEPT the packet (i.e., let the packet go through), or something more complicated.

Under Linux, packet filtering is built into the kernel (as a kernel module, or built right in), and there are a few trickier things we can do with packets, but the general principle of looking at the headers and deciding the fate of the packet is still there.

https://netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-3.html


**What is Virtual Memory?**

Virtual memory is a layer of abstraction provided to each process. The computer has, say, 2GB of physical RAM, addressed from 0 to 2G. A process might see an address space of 4GB, which it has entirely to itself. The mapping from virtual addresses to physical addresses is handled by a memory management unit, which is managed by the operating system. Typically this is done in 4KB "pages".

https://superuser.com/questions/42854/what-is-virtual-memory


**What is swap and what is it used for?**

Simply put, virtual memory is a combination of RAM and disk space that running processes can use. Swap space is the portion of virtual memory that is on the hard disk, used when RAM is full.

https://stackoverflow.com/questions/4970421/whats-the-difference-between-virtual-memory-and-swap-space


**What is an A record, an NS record, a PTR record, a CNAME record, an MX record?**

- Address Mapping record (**A Record**)—also known as a DNS host record, stores a hostname and its corresponding IPv4 address.
- Name Server records (**NS Record**)—specifies that a DNS Zone, such as “example.com” is delegated to a specific Authoritative Name Server, and provides the address of the name server.
- Reverse-lookup Pointer records (**PTR Record**)—allows a DNS resolver to provide an IP address and receive a hostname (reverse DNS lookup).
- Canonical Name record (**CNAME Record**)—can be used to alias a hostname to another hostname. When a DNS client requests a record that contains a CNAME, which points to another hostname, the DNS resolution process is repeated with the new hostname.
- Mail exchanger record (**MX Record**)—specifies an SMTP email server for the domain, used to route outgoing emails to an email server.


**Are there any other RRs and what are they used for?**

- IP Version 6 Address record (**AAAA Record**)—stores a hostname and its corresponding IPv6 address.
- Text Record (**TXT Record**)—typically carries machine-readable data such as opportunistic encryption, sender policy framework, DKIM, DMARC, etc.
- Certificate record (**CERT Record**)—stores encryption certificates—PKIX, SPKI, PGP, and so on.
- Start of Authority (**SOA Record**)—this record appears at the beginning of a DNS zone file, and indicates the Authoritative Name Server for the current DNS zone, contact details for the domain administrator, domain serial number, and information on how frequently DNS information for this zone should be refreshed.
- **SRV record** - the ‘service’ record specifies a host and port for specific services such as Voice Over IP (VOIP), instant messaging, etc.
- etc...


**What is a Split-Horizon DNS?**

When two zones for the same domain are created, one to be used by the internal network, the other used by the external network (Internet).

p.s. In the field of Networking, (Split Horizon) is used for a method that prevents the forming of loops in routing advertisement.


**What is the sticky bit?**

The sticky bit is a user ownership access right flag that can be assigned to files and directories on Unix-like systems

When a directory's sticky bit is set, the filesystem treats the files in such directories in a special way so only the file's owner, the directory's owner, or root user can rename or delete the file. Without the sticky bit set, any user with write and execute permissions for the directory can rename or delete contained files, regardless of the file's owner. Typically this is set on the /tmp directory to prevent ordinary users from deleting or moving other users' files.


**What does the immutable bit do to a file?**

make a file immutable, a file can not be:
 - Modified
 - Deleted
 - Renamed
 - No soft or hard link created by anyone including root user.

Only the root or a process possessing the CAP_LINUX_IMMUTABLE capability can set or clear this attribute. Use the lsattr command to list file attributes.
chattr +i file


**What is the difference between hardlinks and symlinks? What happens when you remove the source to a symlink/hardlink?**

A file in the file system is basically a link to an inode. A hard link, then, just creates another file with a link to the same underlying inode.

When you delete a file, it removes one link to the underlying inode.  The inode is only deleted (or deletable/over-writable) when all links to  the inode have been deleted.

A symbolic link is a link to another name in the file system.

Once a hard link has been made the link is to the inode. Deleting,  renaming, or moving the original file will not affect the hard link as  it links to the underlying inode. Any changes to the data on the inode  is reflected in all files that refer to that inode.

Note: Hard links are only valid within the same File System. Symbolic  links can span file systems as they are simply the name of another  file.

https://stackoverflow.com/questions/185899/what-is-the-difference-between-a-symbolic-link-and-a-hard-link


**What is an inode and what fields are stored in an inode?**

A Unix file is "stored" in two different parts of the disk - the data blocks and the inodes. (I won't get into superblocks and other esoteric information.) The data blocks contain the "contents" of the file. The information about the file is stored elsewhere - in the inode. Both the inodes and data blocks are stored in a "filesystem" which is how a disk partition is organized. The inode contains the following pieces of information
 - Mode/permission (protection)
 - Owner ID
 - Group ID
 - Size of file
 - Number of hard links to the file
 - Time last accessed
 - Time last modified
 - Time inode last modified

https://www.grymoire.com/Unix/Inodes.html



**How to force/trigger a file system check on next reboot?**

- sysVinit: touch /forcefsck  or shutdown -rF (deprecated)
- systemd-fsck:  Kernel Command: fsck.mode= [ "auto", "force", "skip"]  or fsck.repair= ["preen", "yes", "no"]
- tune2fs -c 1 /dev/sda - (file system check will run after each reboot before the loading the OS)


**What is SNMP and what is it used for?**

SNMP stands for Simple Network Management Protocol.  It is a standard way of monitoring hardware and software from nearly any manufacturer, from Juniper, to Cisco, to Microsoft, Unix, and everything in between. SNMP requires only a couple of basic components to work: a management station, and an agent.

SNMP is very simple, yet powerful.  It has the ability to help you manage your network by:
 -  Provide Read/Write abilities – for example you could use it to reset passwords remotely, or re-configure IP addresses.
 -  Collect information on how much bandwidth is being used.
 -  Collect error reports into a log, useful for troubleshooting and identifying trends.
 -  Email an alert when your server is low on disk space.
 -  Monitor your servers’ CPU and Memory use, alert when thresholds are exceeded.
 -  Page or send an SMS text-message when a device fails.
 -  Can perform active polling, i.e. Monitoring station asks devices for status every few minutes.
 -  Passive SNMP – devices can send alerts to a monitoring station on error conditions.


**What is a runlevel and how to get the current runlevel?**

A runlevel is a preset operating state on a sysVinit-like operating system. A system can be booted into any of several runlevels. Each runlevel designates a different system configuration and allows access to a different combination of processes 
```
    0 – System halt i.e the system can be safely powered off with no activity.
    1 – Single user mode.
    2 – Multiple user mode with no NFS(network file system).
    3 – Multiple user mode under the command line interface and not under the graphical user interface.
    4 – User-definable.
    5 – Multiple user mode under GUI (graphical user interface) 
    6 – Reboot which is used to restart the system.
```
```
runlevel - Print previous and current SysV runlevel
```


**What is SSH port forwarding?**

``` ssh -L 80:intra.example.com:80 gw.example.com ```

SSH port forwarding is a mechanism in SSH for tunneling application ports from the client machine to the server machine, or vice versa. It can be used for adding encryption to legacy applications, going through firewalls, and some system administrators and IT professionals use it for opening backdoors into the internal network from their home machines. It can also be abused by hackers and malware to open access from the Internet to the internal network.
https://www.ssh.com/ssh/tunneling/example


**What is the difference between local and remote port forwarding?**

Local forwarding is used to forward a port from the client machine to the server machine. Basically, the SSH client listens for connections on a configured port, and when it receives a connection, it tunnels the connection to an SSH server. The server connects to a configurated destination port, possibly on a different machine than the SSH server.

Typical uses for local port forwarding include:
 -   Tunneling sessions and file transfers through jump servers
 -   Connecting to a service on an internal network from the outside
 -   Connecting to a remote file share over the Internet

Remote Forwarding: (-R option)

```ssh -R 8080:localhost:80 public.example.com```

This allows anyone on the remote server to connect to TCP port 8080 on the remote server. The connection will then be tunneled back to the client host, and the client then makes a TCP connection to port 80 on localhost. Any other host name or IP address could be used instead of localhost to specify the host to connect to. 

This particular example would be useful for giving someone on the outside access to an internal web server.


**What are the steps to add a user to a system without using useradd/adduser?**

- Edit /etc/passwd with vipw and add a new line for the new account. 
- edit /etc/group with vigr
- Create the home directory of the user with mkdir.
- Copy the files from /etc/skel to the new home directory.
- Fix ownerships and permissions with chown and chmod. 
- Set the password with passwd .

https://unix.stackexchange.com/questions/153225/what-steps-to-add-a-user-to-a-system-without-using-useradd-adduser


**What is MAJOR and MINOR numbers of special files?**

The Linux kernel represents character and block devices as pairs of numbers **major:minor**

Some major numbers are reserved for particular device drivers. Other major numbers are dynamically assigned to a device driver when Linux boots. For example, major number 94 is always the major number for DASD devices while the device driver for channel-attached tape devices has no fixed major number. A major number can also be shared by multiple device drivers. See /proc/devices to find out how major numbers are assigned on a running Linux instance.

The device driver uses the minor number <minor> to distinguish individual physical or logical devices. For example, the DASD device driver assigns four minor numbers to each DASD: one to the DASD as a whole and the other three for up to three partitions.

Device drivers assign device names to their devices, according to a device driver-specific naming scheme. Each device name is associated with a minor number.

https://www.ibm.com/support/knowledgecenter/linuxonibm/com.ibm.linux.z.lgdd/lgdd_c_udev.html


**Describe the mknod command and when you'd use it.**
```
mknod - make block or character special files, Create the special file NAME of the given TYPE.
https://unix.stackexchange.com/questions/10723/what-is-the-mknod-command-used-for
```

**Describe a scenario when you get a "filesystem is full" error, but 'df' shows there is free space.**
```
- may be out of i-nodes (df -i)
- may be space taken up by files that have been deleted, but are still open (lsof -nP | grep '(deleted)')
```

**Describe a scenario when deleting a file, but 'df' not showing the space being freed.**
```
file still open
lsof /tmp | grep deleted | sort -n -k7 -r
lsof -nP | grep '(deleted)'
```

**Describe how 'ps' works.**

ps command works by reading files in the proc filesystem. The directory /proc/PID contains various files that provide information about process PID. The content of these files is generated on the fly by the kernel when a process reads them.

https://unix.stackexchange.com/questions/262177/how-does-the-ps-command-work
