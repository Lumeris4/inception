FROM debian:12.10

RUN apt update && apt upgrade -y && apt install -y mariadb-server mariadb-client

COPY ./maria.sh /var/local/bin/.
COPY ./maria.sql /var/local/bin/.
