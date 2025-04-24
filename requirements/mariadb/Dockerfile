FROM debian:11.11

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql
COPY maria.sh .

RUN mkdir /run/mysqld && chmod +x maria.sh

CMD ["./maria.sh"]
