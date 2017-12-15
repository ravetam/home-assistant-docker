FROM python:3.6.3-slim-stretch
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config

RUN echo "deb http://deb.debian.org/debian stretch non-free" >> /etc/apt/sources.list.d/debian-nonfree.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libffi-dev libssl-dev nmap net-tools libcurl3-dev libttspico-utils && \
    pip3 install --no-cache-dir --upgrade homeassistant && \
    pip3 install --no-cache-dir --upgrade aiohttp_cors distro future fuzzywuzzy \ 
                                          home-assistant-frontend==20171204.0 user-agents==1.1.0 \
                                          mutagen netdisco sleekxmpp sqlalchemy xmltodict zeroconf colorlog==3.0.1 \
                                          plexapi pyharmony PyXiaomiGateway SoCo==0.12 yeelight broadlink==0.5 python-miio==0.3.2 \
                                          coinmarketcap phue yahooweather pyowm slacker feedparser python-nmap==0.6.1 && \
    apt-get purge -y --auto-remove build-essential libffi-dev libssl-dev libcurl3-dev && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8123

CMD [ "hass", "--config", "/config" ]
