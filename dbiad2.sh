# Joindre au domaine
realm join -U admin rpidc0.bt8it.afpa
echo P455Support

#Configuration de smbd.conf


echo  -e [global]"\n" > nano /etc/samba/smb.conf

echo ## Browsing/Identification ### >> nano /etc/samba/smb.conf

echo # Change this to the workgroup/NT-domain name your Samba server will part of >> nano /etc/samba/smb.conf
echo -e    workgroup = BT8IT.AFPA"\n" >> nano /etc/samba/smb.conf

echo  -e #### Networking ####"\n" >> nano /etc/samba/smb.conf

echo ;   interfaces = 127.0.0.0/8 eth0 >> nano /etc/samba/smb.conf


echo -e ;   bind interfaces only = yes"\n" >> nano /etc/samba/smb.conf


echo #### Debugging/Accounting #### >> nano /etc/samba/smb.conf

echo    log file = /var/log/samba/log.%m >> nano /etc/samba/smb.conf


echo   max log size = 1000 >> nano /etc/samba/smb.conf


echo   logging = file >> nano /etc/samba/smb.conf


echo   panic action = /usr/share/samba/panic-action %d >> nano /etc/samba/smb.conf

echo ####### Authentication ####### >> nano /etc/samba/smb.conf

echo   server role = standalone server >> nano /etc/samba/smb.conf

echo   obey pam restrictions = yes >> nano /etc/samba/smb.conf

echo   unix password sync = yes >> nano /etc/samba/smb.conf

echo  passwd program = /usr/bin/passwd %u >>nano /etc/samba/smb.conf
echo   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully*. >> nano /etc/samba/smb.conf

echo   pam password change = yes >> nano /etc/samba/smb.conf

echo -e  map to guest = bad user"\n" >> nano /etc/samba/smb.conf

echo ########## Domains ########### >> nano /etc/samba/smb.conf

echo ;   logon path = \\%N\profiles\%U >> nano /etc/samba/smb.conf

echo ;   logon drive = H: >> nano /etc/samba/smb.conf

echo ;   logon script = logon.cmd >> nano /etc/samba/smb.conf

echo ; add user script = /usr/sbin/adduser --quiet --disabled-password --gecos "" %u >> nano /etc/samba/smb.conf

echo ; add machine script  = /usr/sbin/useradd -g machines -c "%u machine account" -d /var/lib/samba -s /bin/false %u >> nano /etc/samba/smb.conf

echo ; add group script = /usr/sbin/addgroup --force-badname %g >> nano /etc/samba/smb.conf

echo ############ Misc ############ >> nano /etc/samba/smb.conf

echo ;  include = /home/samba/etc/smb.conf.%m >> nano /etc/samba/smb.conf


echo ;   idmap config * :              backend = tdb >> nano /etc/samba/smb.conf
echo ;   idmap config * :              range   = 3000-7999 >> nano /etc/samba/smb.conf
echo     idmap config BT8IT.AFPA : backend = tdb >> nano /etc/samba/smb.conf
echo     idmap config BT8IT.AFPA : range   = 100000-999999 >> nano /etc/samba/smb.conf
echo -e  template shell = /bin/bash"\n" >> nano /etc/samba/smb.conf


echo #======================= Share Definitions ======================= >> nano /etc/samba/smb.conf

echo [homes] >> nano /etc/samba/smb.conf

echo    comment = Home Directories >> nano /etc/samba/smb.conf
echo    browseable = no >> nano /etc/samba/smb.conf
echo    read only = yes >> nano /etc/samba/smb.conf
echo    create mask = 0700 >> nano /etc/samba/smb.conf
echo -e   directory mask = 0700"\n" >> nano /etc/samba/smb.conf

echo ;[netlogon] >> nano /etc/samba/smb.conf

echo ;   comment = Network Logon Service >> nano /etc/samba/smb.conf
echo ;   path = /home/samba/netlogon >> nano /etc/samba/smb.conf
echo ;   guest ok = yes >> nano /etc/samba/smb.conf
echo -e ;   read only = yes"\n" >> nano /etc/samba/smb.conf


echo ;[profiles] >> nano /etc/samba/smb.conf

echo ;   comment = Users profiles >> nano /etc/samba/smb.conf
echo ;   path = /home/samba/profiles >> nano /etc/samba/smb.conf
echo ;   guest ok = no >> nano /etc/samba/smb.conf
echo ;   browseable = no >> nano /etc/samba/smb.conf
echo ;   create mask = 0600 >> nano /etc/samba/smb.conf
echo -e ;   directory mask = 0700"\n" >> nano /etc/samba/smb.conf

echo [printers] >> nano /etc/samba/smb.conf

echo   comment = All Printers >> nano /etc/samba/smb.conf
echo   browseable = no >> nano /etc/samba/smb.conf
echo   path = /var/spool/samba >> nano /etc/samba/smb.conf
echo   printable = yes >> nano /etc/samba/smb.conf
echo   guest ok = no >> nano /etc/samba/smb.conf
echo   read only = yes >> nano /etc/samba/smb.conf
echo -e  create mask = 0700"\n" >> nano /etc/samba/smb.conf

echo # Windows clients look for this share name as a source of downloadable >> nano /etc/samba/smb.conf
echo -e # printer drivers"\n" >> nano /etc/samba/smb.conf

echo -e [print$]"\n" >> nano /etc/samba/smb.conf

echo   comment = Printer Drivers >> nano /etc/samba/smb.conf
echo  path = /var/lib/samba/printers >> nano /etc/samba/smb.conf
echo   browseable = yes >> nano /etc/samba/smb.conf
echo   read only = yes >> nano /etc/samba/smb.conf
echo -e   guest ok = no"\n\" >> nano /etc/samba/smb.conf

echo ;   write list = root, @lpadmin >> nano /etc/samba/smb.conf


systemctl restart smbd
