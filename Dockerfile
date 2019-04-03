FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /hiking_trails_challenge
WORKDIR /hiking_trails_challenge

COPY Gemfile /hiking_trails_challenge/Gemfile
COPY Gemfile.lock /hiking_trails_challenge/Gemfile.lock
RUN bundle install
ADD . /hiking_trails_challenge

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
