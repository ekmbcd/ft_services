# /etc/init.d/vsftpd start
adduser -D ftptest
echo ftptest:ftptest | chpasswd
echo "ftptest" >> /etc/vsftpd/vsftpd.userlist
chown -R ftptest:ftptest /home/
chmod -R 755 /
chmod -R 777 /home/
# usermod -s /bin/bash robtest
/etc/init.d/vsftpd restart
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# rc-service vsftpd start
