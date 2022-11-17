FROM ruby:3.1.2

WORKDIR /usr/src/api

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install