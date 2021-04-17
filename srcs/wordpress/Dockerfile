FROM alpine:latest

# installo pacchetti necessari con apk (perche sono su alpine)
RUN apk update && \
	apk add --no-cache nginx wget \
				php7 php7-fpm php7-mbstring php7-session \
				php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
				php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
				php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
				php7-ctype php7-dom

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN	mv wordpress/ /var/www/
RUN mkdir -p /run/nginx

COPY wp-config.php /var/www/wordpress
COPY setup.sh /setup.sh
COPY nginx.conf /etc/nginx/

# COPY default.conf /etc/nginx/conf.d/
# COPY wordpress.sql /wordpress.sql
# COPY wordpress_setup.sh /wordpress_setup.sh
RUN chmod +x /setup.sh

RUN adduser -D -g 'www' www
RUN chown -R www:www /var/www
RUN chown -R www:www /var/lib/nginx

EXPOSE 5050

#CMD php-fpm7 && nginx -g "daemon off;"

CMD /bin/sh "/setup.sh"
