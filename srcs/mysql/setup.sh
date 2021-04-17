#!bin/bash

#sleep 5
/usr/bin/mysql_install_db --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --init-file=/mysql_init.sql #& sleep 3
# mysql -u root < wordpress.sql
# tail -f /dev/null
