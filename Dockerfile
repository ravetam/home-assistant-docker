FROM python:3.7.1-alpine3.8
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl make libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev \
    libssl1.0  libxml2-dev libxslt libxslt-dev && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant==0.110.4 \
                                          PyMySQL \
                                          aiohttp_cors==0.7.0 distro==1.5.0 \ 
                                          home-assistant-frontend==20200519.5 \
                                          mutagen==1.44.0 netdisco==2.6.0 slixmpp==1.5.1 sqlalchemy==1.3.16 xmltodict==0.12.0 \
                                          zeroconf==0.26.3 colorlog==4.1.0 pysonos==0.0.30 plexapi==3.6.0 PyXiaomiGateway==0.12.4 \
                                          python-miio==0.5.0.1 yeelight==0.5.1 broadlink==0.14.0 coinmarketcap==5.0.3 aiohue==2.1.0 \
                                          pyowm==2.10.0 slackclient==2.5.0 feedparser-homeassistant==5.2.2.dev1 \
                                          construct==2.9.45 paho-mqtt==1.5.0 hbmqtt==0.9.5 alpha_vantage==2.2.0 \
                                          PyQRCode==1.2.1 pyotp==2.3.0 aioesphomeapi==2.6.1 python-forecastio==1.4.0 \
                                          wakeonlan==1.1.6 aioftp==0.12.0 PyNaCl==1.3.0 influxdb==5.2.3 hass-nabucasa==0.34.3 \
                                          HAP-python==2.8.4 beautifulsoup4==4.9.0 blockchain==1.4.4 jsonpath==0.82 \
                                          caldav==0.6.1 workalendar && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev libxml2-dev libxslt-dev make

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
