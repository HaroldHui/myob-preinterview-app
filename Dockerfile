FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /app
ADD . /app
WORKDIR /app

CMD ["./scripts/start"]
