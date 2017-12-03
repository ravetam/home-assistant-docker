FROM python:3.6.3-alpine3.6
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update gcc musl-dev linux-headers nmap libsodium nmap curl ffmpeg && \
    rm -rf /root/.cache /var/cache/apk/*

RUN pip3 install --no-cache-dir --upgrade homeassistant

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
