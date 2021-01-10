FROM python:3.7.1-alpine3.8
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
ENV CRYPTOGRAPHY_ALLOW_OPENSSL_102 1
RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl make libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev \
    libssl1.0  libxml2-dev libxslt libxslt-dev && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant==2021.1.0 \
                                          PyMySQL \
                                          aiohttp_cors==0.7.0 distro==1.5.0 \ 
                                          pillow==7.2.0 aiofiles==0.5.0 icmplib==2.0 defusedxml==0.6.0 \
                                          home-assistant-frontend==20201229.1 \
                                          mutagen==1.45.1 netdisco==2.8.2 slixmpp==1.5.2 sqlalchemy==1.3.20 xmltodict==0.12.0 \
                                          zeroconf==0.28.8 colorlog==4.5.0 plexapi==4.2.0 plexauth==0.0.6 plexwebsocket==0.0.12 \
                                          PyXiaomiGateway==0.13.4 pysonos==0.0.37 \
                                          python-miio==0.5.4 yeelight==0.5.4 broadlink==0.16.0 coinmarketcap==5.0.3 aiohue==2.1.0 \
                                          pyowm==3.1.0 slackclient==2.5.0 feedparser-homeassistant==5.2.2.dev1 \
                                          construct==2.10.56 paho-mqtt==1.5.1 hbmqtt==0.9.5 alpha_vantage==2.2.0 \
                                          PyQRCode==1.2.1 pyotp==2.3.0 aioesphomeapi==2.6.3 python-forecastio==1.4.0 \
                                          wakeonlan==1.1.6 aioftp==0.12.0 PyNaCl==1.3.0 influxdb-client==1.8.0 influxdb==5.2.3 hass-nabucasa==0.39.0 \
                                          HAP-python==3.1.0 beautifulsoup4==4.9.1 blockchain==1.4.4 jsonpath==0.82 \
                                          caldav==0.6.1 workalendar && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev libxml2-dev libxslt-dev make

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
