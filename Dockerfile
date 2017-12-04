FROM python:3.6.3-alpine3.6
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update bash gcc musl-dev linux-headers nmap libsodium nmap curl ffmpeg \
    libffi-dev openssl-dev && \
    rm -rf /root/.cache /var/cache/apk/*

RUN pip3 install --no-cache-dir --upgrade homeassistant
RUN pip3 install --no-cache-dir --upgrade aiohttp_cors distro future fuzzywuzzy gTTS-token home-assistant-frontend \
                                          mutagen netdisco sleekxmpp soco sqlalchemy xmltodict zeroconf \
                                          plexapi PyXiaomiGateway pyharmony soco yeelight

CMD [ "hass", "--config", "/config" ]
