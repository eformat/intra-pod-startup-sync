FROM nginx:stable-alpine

ADD start.sh /
ADD nginx.conf /
ADD default.conf /etc/nginx/conf.d/

VOLUME ["/var/cache/nginx"]

EXPOSE 8080

CMD /start.sh
