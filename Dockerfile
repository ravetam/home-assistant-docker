FROM python:3.6.3-alpine3.6
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
WORKDIR /app

RUN apk add --no-cache --update bash gcc musl-dev linux-headers nmap libsodium nmap curl \
    libffi-dev openssl-dev && \
    rm -rf /root/.cache /var/cache/apk/*

RUN pip3 install --no-cache-dir --upgrade homeassistant==0.59.1
RUN pip3 install --no-cache-dir --upgrade aiohttp_cors distro future fuzzywuzzy baidu-aip==1.6.6 \ 
                                          home-assistant-frontend==20171204.0 user-agents==1.1.0 \
                                          mutagen netdisco sleekxmpp sqlalchemy xmltodict zeroconf colorlog==3.0.1 \
                                          plexapi pyharmony PyXiaomiGateway SoCo==0.12 yeelight broadlink==0.5 python-miio coinmarketcap \
                                          phue yahooweather pyowm slacker feedparser

CMD [ "hass", "--config", "/config" ]
