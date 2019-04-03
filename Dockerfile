FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /hiking_trails_challenge
WORKDIR /hiking_trails_challenge

COPY Gemfile /hiking_trails_challenge/Gemfile
COPY Gemfile.lock /hiking_trails_challenge/Gemfile.lock
RUN bundle install
ADD . /hiking_trails_challenge
