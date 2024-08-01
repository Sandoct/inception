FROM	debian:buster

RUN		apt-get update && apt-get install -y nginx openssl
#RUN		apt-get install -y vim

RUN 	mkdir -p /etc/nginx/ssl

RUN		openssl req -x509 -nodes \
			-out /etc/nginx/ssl/inception.crt \
			-keyout /etc/nginx/ssl/inception.key \
			-subj "/C=FR/ST=Angouleme/L=Paris/O=42/OU=42/CN=gpouzet.42.fr/UID=gpouzet"

RUN		mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

CMD		["nginx", "-g", "daemon off;"]
