FROM ruby:2.5.5-alpine

RUN apk update \
  && apk upgrade \
  && apk add --update \
      tzdata \
      git \
      linux-headers \
      build-base \
      sqlite-dev \
      freetds-dev \
      && rm -rf /var/cache/apk/*

RUN mkdir -p /var/www/app

WORKDIR /var/www/app

RUN gem install bundler -v 1.17.3

ADD Gemfile Gemfile.lock ./

RUN bundle install

ADD . /var/www/app
