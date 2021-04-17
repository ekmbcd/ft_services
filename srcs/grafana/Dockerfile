FROM alpine:latest

RUN apk update && \
	apk add --no-cache grafana openrc telegraf

RUN mkdir -p /etc/grafana/provisioning/dashboards /usr/share/grafana/conf/provisioning/datasources/

COPY datasources.yml /usr/share/grafana/conf/provisioning/datasources/

EXPOSE 3000

WORKDIR /usr/share/grafana

COPY grafana.db /usr/share/grafana/data/

ENTRYPOINT  /usr/sbin/grafana-server --config=/etc/grafana.ini
