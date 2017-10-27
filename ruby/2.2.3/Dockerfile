FROM ruby:2.2.3

ENV PHANTOMJS_VERSION 2.1.1
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 /tmp/
RUN tar xf /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 -C /tmp && \
      mv /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/bin/phantomjs && \
      chown root:root /usr/bin/phantomjs && \
      chmod 0755 /usr/bin/phantomjs && \
      rm -rf /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64 /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2

RUN apt-get update && \
      apt-get install -y imagemagick libmagickwand-dev ffmpegthumbnailer && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/
ONBUILD RUN bundle install

ONBUILD COPY . /usr/src/app
