FROM	debian:11

RUN	apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server
#RUN		apt-get install -y vim

COPY	50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY	tools/init.sql /etc/mysql/init.sql

RUN	mkdir -p /run/mysql
COPY	tools/maria.sh /run/mariadb/maria.sh
RUN	chmod +x /run/mariadb/maria.sh

#EXPOSE 3306

#CMD	["run/mariadb/maria.sh"]
ENTRYPOINT	["bash", "/run/mariadb/maria.sh"]
#CMD ["mysql"]
