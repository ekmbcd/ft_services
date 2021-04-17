FROM alpine:latest

RUN mkdir -p /etc/telegraf

RUN apk update && apk add --no-cache wget

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz && \
		tar xf telegraf-1.14.5-static_linux_amd64.tar.gz && \
		rm -rf telegraf-1.14.5-static_linux_amd64.tar.gz

RUN		cp telegraf/telegraf /usr/bin/

COPY telegraf.config /etc/telegraf/telegraf.conf

EXPOSE 8125

ENTRYPOINT [ "telegraf --config /etc/telegraf/telegraf.conf" ]
