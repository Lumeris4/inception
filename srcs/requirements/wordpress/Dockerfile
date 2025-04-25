FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y php-fpm php-mysqli curl

RUN mkdir -p /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY setup.sh .

RUN chmod +x setup.sh

CMD ["./setup.sh"]
