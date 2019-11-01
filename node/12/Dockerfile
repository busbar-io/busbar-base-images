FROM node:12.13.0

ENV PHANTOMJS_VERSION 2.1.1
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 /tmp/
RUN tar xf /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 -C /tmp && \
      mv /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/bin/phantomjs && \
      chown root:root /usr/bin/phantomjs && \
      chmod 0755 /usr/bin/phantomjs && \
      rm -rf /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64 /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2

RUN apt-get update && \
      apt-get install -y imagemagick libmagickwand-dev && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

RUN npm install -g bower && npm install -g gulp

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
