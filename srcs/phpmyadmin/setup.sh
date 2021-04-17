# /usr/bin/sshd
php-fpm7
nginx -g "daemon off;"
/usr/bin/php -S 0.0.0.0:80 -t /www/
rm setup.sh
