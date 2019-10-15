FROM ruby:2.5

WORKDIR /usr/src/app
RUN apt update
RUN apt install -y nodejs

COPY Gemfile ./
RUN bundle install

COPY . .