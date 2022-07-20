FROM alpine:3.14
ARG yversion
LABEL version=$yversion \
      description="YAGES gRPC server" \
      maintainer="michael.hausenblas@gmail.com"
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk --no-cache add glibc-2.30-r0.apk && \
    rm glibc-2.30-r0.apk
COPY ./srv-yages /app/srv-yages
WORKDIR /app
RUN chown -R 1001:1 /app
USER 1001
RUN chmod +x srv-yages
EXPOSE 9000
CMD ["/app/srv-yages"]
