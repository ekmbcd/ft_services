FROM alpine:latest

RUN apk update && apk add --no-cache vsftpd openssl openrc

RUN mkdir -p /etc/vsftpd/ /home/ftptest/

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY setup.sh /

RUN openssl req -x509 -nodes -days 365 -new -newkey rsa:2048 \
	-subj "/C=IT/ST=Italy/L=Rome/O=luiss/OU=42rome/CN=etaranti" \
	-keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt



EXPOSE 21 30000 30001 30002 30003

CMD sh setup.sh
