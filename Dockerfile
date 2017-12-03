FROM python:3.6.3-slim-stretch
LABEL maintainer="Lazcad <support@lazcad.com>"

VOLUME /config

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    git clone -b master "https://github.com/home-assistant/home-assistant.git" /usr/src/app && \
    rm -r /usr/src/app/docs/ /usr/src/app/tests/ /usr/src/app/.git/ && \
    apt-get install -y --no-install-recommends build-essential libxrandr-dev \
                                               nmap net-tools lbcurl3-dev bluetooth libglib2.0-dev libbluetooth-dev && \
    pip3 install --no-cache-dir -r requirements_all.txt && \                         
    pip3 install --no-cache-dir uvloop cchardet cython && \
    apt-get remove -y --purge git build-essential libxrandr-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src/app/build/

CMD [ "python", "-m", "homeassistant", "--config", "/config" ]
