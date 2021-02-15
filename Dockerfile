FROM python:3.9.1-alpine3.13
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
ENV CRYPTOGRAPHY_ALLOW_OPENSSL_102 1
RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl make libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev \
    libssl1.0  libxml2-dev libxslt libxslt-dev && \
    rm -rf /root/.cache /var/cache/apk/*

RUN pip3 install --no-cache-dir --upgrade homeassistant==2021.2.3 \
                                          PyMySQL \
                                          aiohttp_cors==0.7.0 distro==1.5.0 \ 
                                          pillow==8.1.0 icmplib==2.0 defusedxml==0.6.0 \
                                          home-assistant-frontend==20210127.7 \
                                          mutagen==1.45.1 netdisco==2.8.2 slixmpp==1.6.0 sqlalchemy==1.3.22 xmltodict==0.12.0 \
                                          zeroconf==0.28.8 colorlog==4.6.2 plexapi==4.3.1 plexauth==0.0.6 plexwebsocket==0.0.12 \
                                          PyXiaomiGateway==0.13.4 pysonos==0.0.37 \
                                          python-miio==0.5.4 yeelight==0.5.4 broadlink==0.16.0 coinmarketcap==5.0.3 aiohue==2.1.0 \
                                          pyowm==3.1.1 slackclient==2.5.0 feedparser==6.0.2 \
                                          construct==2.10.56 paho-mqtt==1.5.1 alpha_vantage==2.3.1 \
                                          PyQRCode==1.2.1 pyotp==2.3.0 aioesphomeapi==2.6.4 python-forecastio==1.4.0 \
                                          wakeonlan==1.1.6 aioftp==0.12.0 PyNaCl==1.3.0 influxdb-client==1.8.0 influxdb==5.2.3 hass-nabucasa==0.41.0 \
                                          HAP-python==3.1.0 beautifulsoup4==4.9.1 blockchain==1.4.4 jsonpath==0.82 \
                                          sonarr==0.3.0 pynzbgetapi==0.2.0 \
                                          caldav==0.7.1 workalendar

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
