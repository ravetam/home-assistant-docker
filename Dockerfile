FROM python:3.7.1-alpine3.8
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config
RUN apk add --no-cache --update bash gcc musl-dev linux-headers curl make libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev \
    libssl1.0 && \
    rm -rf /root/.cache /var/cache/apk/* && \
    pip3 install --no-cache-dir --upgrade homeassistant==0.92.2 \
                                          PyMySQL \
                                          aiohttp_cors==0.7.0 distro==1.4.0 \ 
                                          home-assistant-frontend==20190427.0 \
                                          mutagen==1.42.0 netdisco==2.6.0 slixmpp==1.4.2 sqlalchemy==1.3.0 xmltodict==0.11.0 \
                                          zeroconf==0.21.3 colorlog==4.0.2 pysonos==0.0.10 plexapi==3.0.6 PyXiaomiGateway==0.12.2 \
                                          python-miio==0.4.5 yeelight==0.5.0 broadlink==0.9.0 coinmarketcap==5.0.3 aiohue==1.9.1 \
                                          yahooweather==0.10 pyowm==2.10.0 slacker==0.12.0 feedparser-homeassistant==5.2.2.dev1 \
                                          construct==2.9.45 paho-mqtt==1.4.0 alpha_vantage==2.1.0 \
                                          PyQRCode==1.2.1 pyotp==2.2.6 aioesphomeapi==2.0.1 python-forecastio==1.4.0 \
                                          wakeonlan==1.1.6 aioftp==0.12.0 PyNaCl==1.3.0 baidu-aip-1.6.6 \
                                          workalendar && \
    apk del gcc musl-dev linux-headers curl libffi-dev openssl-dev libjpeg-turbo-dev zlib-dev make

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
