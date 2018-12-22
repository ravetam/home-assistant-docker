FROM python:3.7.1-alpine3.8
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config

RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl libssl1.0 \
    libffi-dev openssl-dev && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant \
                                          aiohttp_cors==0.7.0 distro==1.3.0 \ 
                                          home-assistant-frontend==20181211.2 \
                                          mutagen==1.41.1 netdisco==2.2.0 slixmpp==1.4.1 sqlalchemy==1.2.14 xmltodict==0.11.0 \
                                          zeroconf==0.21.3 colorlog==3.1.4 pysonos==0.0.5 plexapi==3.0.6 PyXiaomiGateway==0.11.1 \
                                          python-miio==0.4.4 yeelight==0.4.3 broadlink==0.9.0 coinmarketcap==5.0.3 aiohue==1.5.0 \
                                          yahooweather==0.10 pyowm==2.9.0 slacker==0.11.0 feedparser==5.2.1 construct==2.9.45 && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
