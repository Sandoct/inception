FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y && apt-get install -y \
	php-fpm php-mysqli curl

#RUN 	apt-get install -y wget php php-fpm php-mysql mariadb-client
RUN	mkdir -p /var/run/php-fpm

RUN	service php7.3-fpm start
COPY	www.conf /etc/php/7.3/fpm/pool.d/.
COPY	tools/script.sh .
RUN	chmod +x script.sh

CMD	["./script.sh"]
#CMD ["/usr/sbin/php-fpm7.3", "-F"]
