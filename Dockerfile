FROM python:3.6.3-alpine3.6
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update bash gcc musl-dev linux-headers nmap libsodium nmap curl \
    libffi-dev openssl-dev && \
    rm -rf /root/.cache /var/cache/apk/*

RUN pip3 install --no-cache-dir --upgrade homeassistant
RUN pip3 install --no-cache-dir --upgrade aiohttp_cors distro future fuzzywuzzy \ 
                                          home-assistant-frontend==20171204.0 user-agents==1.1.0 \
                                          mutagen netdisco sleekxmpp sqlalchemy xmltodict zeroconf colorlog==3.0.1 \
                                          plexapi pyharmony PyXiaomiGateway SoCo==0.12 yeelight broadlink==0.5 python-miio==0.3.2 \
                                          coinmarketcap phue yahooweather pyowm slacker feedparser

CMD [ "hass", "--config", "/config" ]
