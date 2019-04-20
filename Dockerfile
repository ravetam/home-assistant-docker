FROM python:3.7.1-alpine3.8
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config

RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl make libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev \
    libssl1.0 && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant \
                                          PyMySQL \
                                          aiohttp_cors==0.7.0 distro==1.4.0 \ 
                                          home-assistant-frontend==20190331.0 \
                                          mutagen==1.42.0 netdisco==2.5.0 slixmpp==1.4.2 sqlalchemy==1.3.0 xmltodict==0.11.0 \
                                          zeroconf==0.21.3 colorlog==4.0.2 pysonos==0.0.8 plexapi==3.0.6 PyXiaomiGateway==0.12.2 \
                                          python-miio==0.4.5 yeelight==0.4.4 broadlink==0.9.0 coinmarketcap==5.0.3 aiohue==1.9.1 \
                                          pyowm==2.10.0 slacker==0.12.0 feedparser-homeassistant==5.2.2.dev1 construct==2.9.45 \
                                          PyQRCode==1.2.1 pyotp==2.2.6 aioesphomeapi==1.7.0 python-forecastio==1.4.0 paho-mqtt==1.4.0 \
                                          wakeonlan==1.1.6 aioftp==0.12.0 PyNaCl==1.3.0 alpha_vantage==2.1.0 workalendar \
                                          baidu-aip-1.6.6.0 && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev make

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
