#!/bin/sh
set -eu

: "${PORT:=8080}"
: "${WS_PATH:=/ray}"
: "${UUID:?UUID environment variable is required}"

cat > /tmp/config.json <<EOF
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "tag": "vmess-ws",
      "listen": "0.0.0.0",
      "port": ${PORT},
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${UUID}",
            "alterId": 0
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": {
          "path": "${WS_PATH}"
        }
      }
    }
  ],
  "outbounds": [
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {}
    }
  ]
}
EOF

exec /usr/local/v2ray/v2ray run -config /tmp/config.json
