# FROM alpine:latest

# COPY my.cnf setup.sh ./

# RUN apk update && \
# 	apk add --no-cache mysql

# # # installo php
# # RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring


# # Setup MySQL
# RUN mkdir -p /run/mysqld && \
# 	mv my.cnf /etc/

# # # Install telegraf
# # RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ telegraf && \
# # 	mkdir -p /etc/telegraf && \
# # 	mv telegraf.conf /etc/telegraf/

# EXPOSE 3306

# CMD ./setup.sh

# ----------------

# FROM alpine:3.12 se non funziona latest usare questa, latest puo dare problem i quando si pulla
#FROM alpine:latest
FROM alpine:latest

#RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories
#RUN apk add mysql mysql-client
RUN apk update && \
	apk add --no-cache mysql mysql-client

# bisogna creare directory prima di copiare my.cnf, altrimenti da errore
RUN	mkdir -p /run/mysqld

COPY my.cnf /etc/.
COPY mysql_init.sql wordpress.sql /
COPY setup.sh init_wordpress.sh /

RUN chmod +x /setup.sh

EXPOSE 3306

ENTRYPOINT ["sh","/setup.sh"]
#CMD ./setup.sh
