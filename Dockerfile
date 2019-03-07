FROM docker:stable-git
LABEL maintainer="legovaer@me.com"

# build tools for native dependencies
RUN apk add --update git yarn

RUN git clone https://github.com/lando/lando.git /tmp/lando \
  && cd /tmp/lando \
  && yarn \
  && mkdir -p /usr/local/bin \
  && ln -s /tmp/lando/bin/lando.js /usr/local/bin/lando \
  && lando version
