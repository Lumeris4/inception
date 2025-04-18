FROM debian:12.10

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY maria.sql /etc/mysql/init.sql
COPY mariadb.sh .

RUN mkdir /run/mysqld && chmod +x mariadb.sh

CMD ["./mariadb.sh"]


