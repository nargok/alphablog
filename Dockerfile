FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
RUN mkdir /alphablog
WORKDIR /alphablog
COPY Gemfile /alphablog/Gemfile
COPY Gemfile.lock /alphablog/Gemfile.lock
RUN bundle install
COPY . /alphablog