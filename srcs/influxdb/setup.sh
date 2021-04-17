# adduser -D influxdb
# echo influxdb:influxdb | chpasswd

# chown influxdb:influxdb /etc/influxdb/*
# chown influxdb:influxdb /var/lib/influxdb

# openrc
# touch /run/openrc/softlevel
# rc-update add telegraf

# influx v1 auth create \
#   --username 'influxdb' \
#   --password 'influxdb'
influxd -config /etc/influxdb/influxdb.conf
