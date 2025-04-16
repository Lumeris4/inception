FROM debian:12.10

RUN apt update && apt install -y mariadb-server mariadb-client && apt clean

COPY ./mariadb.sh /var/local/bin/mariadb.sh
COPY ./maria.sql /var/local/bin/maria.sql
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/.

RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld && \
    chmod +x /var/local/bin/mariadb.sh

CMD ["/var/local/bin/mariadb.sh"]


