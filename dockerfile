FROM alpine:3.20

RUN apk add --no-cache curl unzip ca-certificates

WORKDIR /app

RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray.zip -d /usr/local/v2ray \
    && chmod +x /usr/local/v2ray/v2ray \
    && rm -f v2ray.zip

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENV PORT=8080
ENV WS_PATH=/ray

EXPOSE 8080

CMD ["/app/start.sh"]
