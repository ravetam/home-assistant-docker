FROM python:3.6.4-alpine3.7
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config

RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl libssl1.0 \
    libffi-dev openssl-dev && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant \
                                          aiohttp_cors==0.7.0 distro==1.3.0 \ 
                                          home-assistant-frontend==20180625.0 \
                                          mutagen==1.40.0 netdisco==1.4.1 sleekxmpp==1.3.2 sqlalchemy==1.2.8 xmltodict==0.11.0 \
                                          zeroconf==0.20.0 colorlog==3.1.4 plexapi==3.0.6 pyharmony==1.0.20 PyXiaomiGateway==0.9.5 \
                                          python-miio==0.4.0 SoCo==0.14 yeelight==0.4.0 broadlink==0.9.0 coinmarketcap==5.0.3 aiohue==1.5.0 \
                                          yahooweather==0.10 pyowm==2.8.0 slacker==0.9.65 feedparser==5.2.1 construct==2.9.41 && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
