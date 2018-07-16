FROM arm64v8/alpine:latest
LABEL maintainer="Bind Docker Image Maintainer <me@susinthiran.com>"
RUN apk update && apk upgrade && apk add bind bash && mkdir -p /run/named && chown named: /run/named
EXPOSE 53/udp 53/tcp
COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh
RUN echo "about to start Bind"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/named"]
