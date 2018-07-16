FROM arm64v8/alpine:latest
LABEL maintainer="Nginx Docker Image Maintainer <me@susinthiran.com>"
RUN apk update && apk upgrade && apk add nginx bash
#&& mkdir -p /run/named && chown named: /run/named
EXPOSE 80/tcp
COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh
RUN echo "about to start Nginx"
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/usr/sbin/nginx"]
