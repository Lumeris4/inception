
FROM debian:12.10

RUN apt update && \
    apt upgrade -y && \
    apt install -y openssl nginx && \
    mkdir -p /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 \
        -subj "/C=FR/ST=Paris/L=Paris/O=42/CN=lelanglo.42.fr" \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/private/nginx.crt

COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]


