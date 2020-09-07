# Joindre au domaine
realm join -U admin rpidc0.bt8it.afpa

#Configuration de smbd.conf
> /etc/samba/smb.conf
echo [global] >> /etc/samba/smb.conf

echo ## Browsing/Identification ### >> nano /etc/samba/smb.conf

echo # Change this to the workgroup/NT-domain name your Samba server will part of >> nano /etc/samba/smb.conf
echo workgroup = BT8IT.AFPA >> /etc/samba/smb.conf

echo #### Networking ####"\n" >> nano /etc/samba/smb.conf

echo #### Debugging/Accounting #### >> nano /etc/samba/smb.conf

echo log file = /var/log/samba/log.%m >> /etc/samba/smb.conf


echo max log size = 1000 >> /etc/samba/smb.conf


echo logging = file >> /etc/samba/smb.conf


echo panic action = /usr/share/samba/panic-action %d >> /etc/samba/smb.conf

echo ####### Authentication ####### >> nano /etc/samba/smb.conf

echo server role = standalone server >> /etc/samba/smb.conf

echo obey pam restrictions = yes >> /etc/samba/smb.conf

echo unix password sync = yes >> /etc/samba/smb.conf

echo passwd program = /usr/bin/passwd %u >> /etc/samba/smb.conf
echo passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully*. >> /etc/samba/smb.conf

echo pam password change = yes >> /etc/samba/smb.conf

echo map to guest = bad user >> /etc/samba/smb.conf

echo ########## Domains ########### >> nano /etc/samba/smb.conf

echo ############ Misc ############ >> nano /etc/samba/smb.conf

echo idmap config BT8IT.AFPA : backend = tdb >> /etc/samba/smb.conf
echo idmap config BT8IT.AFPA : range   = 100000-999999 >> /etc/samba/smb.conf
echo template shell = /bin/bash"\n" >> /etc/samba/smb.conf


echo #======================= Share Definitions ======================= >> nano /etc/samba/smb.conf

echo [homes] >> /etc/samba/smb.conf

echo comment = Home Directories >> /etc/samba/smb.conf
echo browseable = no >> /etc/samba/smb.conf
echo read only = yes >> /etc/samba/smb.conf
echo create mask = 0700 >> /etc/samba/smb.conf
echo directory mask = 0700 >> /etc/samba/smb.conf

echo [printers] >> /etc/samba/smb.conf

echo comment = All Printers >> /etc/samba/smb.conf
echo browseable = no >> /etc/samba/smb.conf
echo path = /var/spool/samba >> /etc/samba/smb.conf
echo printable = yes >> /etc/samba/smb.conf
echo guest ok = no >> /etc/samba/smb.conf
echo read only = yes >> /etc/samba/smb.conf
echo create mask = 0700 >> /etc/samba/smb.conf

echo # Windows clients look for this share name as a source of downloadable >> nano /etc/samba/smb.conf
echo # printer drivers"\n" >> nano /etc/samba/smb.conf

echo [print$] >> /etc/samba/smb.conf

echo comment = Printer Drivers >> /etc/samba/smb.conf
echo path = /var/lib/samba/printers >> /etc/samba/smb.conf
echo browseable = yes >> /etc/samba/smb.conf
echo read only = yes >> /etc/samba/smb.conf
echo guest ok = no >> /etc/samba/smb.conf

systemctl restart smbd
