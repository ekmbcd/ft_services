FROM alpine:latest

#RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories
#RUN apk add mysql mysql-client
RUN apk update && \
	apk add --no-cache influxdb openrc telegraf

# bisogna creare directory prima di copiare my.cnf, altrimenti da errore
RUN	mkdir -p /etc/influxdb /var/lib/influxdb


COPY setup.sh init.iql /
COPY influxdb.conf /etc/influxdb/

RUN chmod +x /setup.sh

EXPOSE 8086

ENTRYPOINT ["sh","/setup.sh"]
