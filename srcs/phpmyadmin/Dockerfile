FROM alpine:latest

COPY default setup.sh config.inc.php ./

RUN mkdir -p /run/nginx

RUN apk update && apk add --no-cache nginx\
	php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz .


RUN mv default /etc/nginx/nginx.conf

RUN tar -xvf phpMyAdmin-5.0.2-english.tar.gz

RUN	mv phpMyAdmin-5.0.2-english /www

RUN	mv config.inc.php /www/

#RUN mkdir /www/tmp

RUN	rm -f phpMyAdmin-5.0.2-english.tar.gz

# RUN chmod -R +xr www

EXPOSE 80

RUN chmod +x /setup.sh

CMD sh setup.sh
