FROM python:3.7.1-alpine3.8
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl make libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev \
    libssl1.0 && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant==0.100.3 \
                                          PyMySQL \
                                          aiohttp_cors==0.7.0 distro==1.4.0 \ 
                                          home-assistant-frontend==20191002.2 \
                                          mutagen==1.42.0 netdisco==2.6.0 slixmpp==1.4.2 sqlalchemy==1.3.8 xmltodict==0.12.0 \
                                          zeroconf==0.23.0 colorlog==4.0.2 pysonos==0.0.23 plexapi==3.0.6 PyXiaomiGateway==0.12.4 \
                                          python-miio==0.4.5 yeelight==0.5.0 broadlink==0.11.1 coinmarketcap==5.0.3 aiohue==1.9.1 \
                                          pyowm==2.10.0 slacker==0.13.0 feedparser-homeassistant==5.2.2.dev1 \
                                          construct==2.9.45 paho-mqtt==1.4.0 hbmqtt==0.9.5 alpha_vantage==2.1.0 \
                                          PyQRCode==1.2.1 pyotp==2.3.0 aioesphomeapi==2.2.0 python-forecastio==1.4.0 \
                                          wakeonlan==1.1.6 aioftp==0.12.0 PyNaCl==1.3.0 influxdb==5.2.3 \
                                          workalendar && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev make

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
