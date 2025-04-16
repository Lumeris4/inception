FROM debian:12.10

RUN apt update && \
    apt upgrade -y && \
    apt install -y php-fpm php-mysqli curl && \
    apt clean

COPY ./www.conf /etc/php/8.2/fpm/pool.d/.

COPY ./setup.sh .
RUN chmod +x setup.sh

CMD ["/bin/bash", "/setup.sh"]

