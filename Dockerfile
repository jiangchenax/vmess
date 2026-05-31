FROM ghcr.io/xtls/xray-core:latest

COPY config.json /usr/local/etc/xray/config.json

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/xray"]
CMD ["run", "-config", "/usr/local/etc/xray/config.json"]
