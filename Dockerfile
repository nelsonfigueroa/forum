FROM ruby:2.6.3-alpine3.9

RUN apk add --no-cache --update build-base
RUN apk add --no-cache --update linux-headers
RUN apk add --no-cache --update postgresql-dev
RUN apk add --no-cache --update nodejs
RUN apk add --no-cache --update sqlite-dev
RUN apk add --no-cache --update tzdata
RUN mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.0.1
RUN bundle install

COPY . .

RUN rails db:setup

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
