FROM python:3.6.3-slim-stretch
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config

#RUN apk add --no-cache --update bash gcc musl-dev linux-headers nmap libsodium nmap curl \
#    libffi-dev openssl-dev && \
#    rm -rf /root/.cache /var/cache/apk/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libffi-dev openssl-dev nmap net-tools libcurl3-dev && \
    pip3 install --no-cache-dir --upgrade homeassistant && \
    pip3 install --no-cache-dir --upgrade aiohttp_cors distro future fuzzywuzzy \ 
                                          home-assistant-frontend==20171204.0 user-agents==1.1.0 \
                                          mutagen netdisco sleekxmpp sqlalchemy xmltodict zeroconf colorlog==3.0.1 \
                                          plexapi pyharmony PyXiaomiGateway SoCo==0.12 yeelight broadlink==0.5 python-miio==0.3.2 \
                                          coinmarketcap phue yahooweather pyowm slacker feedparser python-nmap==0.6.1 && \
    apt-get purge -y --auto-remove build-essential libffi-dev openssl-dev libcurl3-dev

CMD [ "hass", "--config", "/config" ]
