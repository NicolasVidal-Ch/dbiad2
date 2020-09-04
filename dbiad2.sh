# Joindre au domaine
realm join -U admin rpidc0.bt8it.afpa


#Configuration de smbd.conf
> /etc/samba/smb.conf
echo  -e [global]"\n" >> /etc/samba/smb.conf

echo ## Browsing/Identification ### >>   /etc/samba/smb.conf

echo # Change this to the workgroup/NT-domain name your Samba server will part of >>   /etc/samba/smb.conf

echo -e    workgroup = BT8IT.AFPA"\n" >>   /etc/samba/smb.conf

echo  -e #### Networking ####"\n" >>   /etc/samba/smb.conf

echo ;   interfaces = 127.0.0.0/8 eth0 >>   /etc/samba/smb.conf


echo -e ;   bind interfaces only = yes"\n" >>   /etc/samba/smb.conf


echo #### Debugging/Accounting #### >>   /etc/samba/smb.conf

echo    log file = /var/log/samba/log.%m >>   /etc/samba/smb.conf


echo   max log size = 1000 >>   /etc/samba/smb.conf


echo   logging = file >>   /etc/samba/smb.conf


echo   panic action = /usr/share/samba/panic-action %d >>   /etc/samba/smb.conf

echo ####### Authentication ####### >>   /etc/samba/smb.conf

echo   server role = standalone server >>   /etc/samba/smb.conf

echo   obey pam restrictions = yes >>   /etc/samba/smb.conf

echo   unix password sync = yes >>   /etc/samba/smb.conf

echo  passwd program = /usr/bin/passwd %u >>  /etc/samba/smb.conf
echo   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully*. >>   /etc/samba/smb.conf

echo   pam password change = yes >>   /etc/samba/smb.conf

echo -e  map to guest = bad user"\n" >>   /etc/samba/smb.conf

echo ########## Domains ########### >>   /etc/samba/smb.conf

echo ;   logon path = \\%N\profiles\%U >>   /etc/samba/smb.conf

echo ;   logon drive = H: >>   /etc/samba/smb.conf

echo ;   logon script = logon.cmd >>   /etc/samba/smb.conf

echo ; add user script = /usr/sbin/adduser --quiet --disabled-password --gecos "" %u >>   /etc/samba/smb.conf

echo ; add machine script  = /usr/sbin/useradd -g machines -c "%u machine account" -d /var/lib/samba -s /bin/false %u >>   /etc/samba/smb.conf

echo ; add group script = /usr/sbin/addgroup --force-badname %g >>   /etc/samba/smb.conf

echo ############ Misc ############ >>   /etc/samba/smb.conf

echo ;  include = /home/samba/etc/smb.conf.%m >>   /etc/samba/smb.conf


echo ;   idmap config * :              backend = tdb >>   /etc/samba/smb.conf
echo ;   idmap config * :              range   = 3000-7999 >>   /etc/samba/smb.conf
echo     idmap config BT8IT.AFPA : backend = tdb >>   /etc/samba/smb.conf
echo     idmap config BT8IT.AFPA : range   = 100000-999999 >>   /etc/samba/smb.conf
echo -e  template shell = /bin/bash"\n" >>   /etc/samba/smb.conf


echo #======================= Share Definitions ======================= >>   /etc/samba/smb.conf

echo [homes] >>   /etc/samba/smb.conf

echo    comment = Home Directories >>   /etc/samba/smb.conf
echo    browseable = no >>   /etc/samba/smb.conf
echo    read only = yes >>   /etc/samba/smb.conf
echo    create mask = 0700 >>   /etc/samba/smb.conf
echo -e   directory mask = 0700"\n" >>   /etc/samba/smb.conf

echo ;[netlogon] >>   /etc/samba/smb.conf

echo ;   comment = Network Logon Service >>   /etc/samba/smb.conf
echo ;   path = /home/samba/netlogon >>   /etc/samba/smb.conf
echo ;   guest ok = yes >>   /etc/samba/smb.conf
echo -e ;   read only = yes"\n" >>   /etc/samba/smb.conf


echo ;[profiles] >>   /etc/samba/smb.conf

echo ;   comment = Users profiles >>   /etc/samba/smb.conf
echo ;   path = /home/samba/profiles >>   /etc/samba/smb.conf
echo ;   guest ok = no >>   /etc/samba/smb.conf
echo ;   browseable = no >>   /etc/samba/smb.conf
echo ;   create mask = 0600 >>   /etc/samba/smb.conf
echo -e ;   directory mask = 0700"\n" >>   /etc/samba/smb.conf

echo [printers] >>   /etc/samba/smb.conf

echo   comment = All Printers >>   /etc/samba/smb.conf
echo   browseable = no >>   /etc/samba/smb.conf
echo   path = /var/spool/samba >>   /etc/samba/smb.conf
echo   printable = yes >>   /etc/samba/smb.conf
echo   guest ok = no >>   /etc/samba/smb.conf
echo   read only = yes >>   /etc/samba/smb.conf
echo -e  create mask = 0700"\n" >>   /etc/samba/smb.conf

echo # Windows clients look for this share name as a source of downloadable >>   /etc/samba/smb.conf
echo -e # printer drivers"\n" >>   /etc/samba/smb.conf

echo -e [print$]"\n" >>   /etc/samba/smb.conf

echo   comment = Printer Drivers >>   /etc/samba/smb.conf
echo  path = /var/lib/samba/printers >>   /etc/samba/smb.conf
echo   browseable = yes >>   /etc/samba/smb.conf
echo   read only = yes >>   /etc/samba/smb.conf
echo -e   guest ok = no"\n\" >>   /etc/samba/smb.conf

echo ;   write list = root, @lpadmin >>   /etc/samba/smb.conf


systemctl restart smbd
