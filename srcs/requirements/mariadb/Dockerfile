# Description: MariaDB Dockerfile

# pull base image
FROM debian:11

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y mariadb-server
RUN chown -R mysql: /var/lib/mysql
RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld
# copy file from host to container
COPY tools/mdb-conf.sh /mdb-conf.sh

# set permissions to the file
RUN chmod +x /mdb-conf.sh

# define entrypoint command to run when the container starts
ENTRYPOINT ["./mdb-conf.sh"]
