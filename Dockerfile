FROM ruby:2.7-alpine

RUN apk update && apk upgrade && apk add ruby ruby-json ruby-io-console ruby-bundler ruby-irb ruby-bigdecimal tzdata mysql-client && apk add nodejs && apk add curl-dev ruby-dev build-base libffi-dev && apk add build-base libxslt-dev libxml2-dev ruby-rdoc mysql-dev

RUN apk add nodejs
RUN apk add yarn
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install ovirt-engine-sdk -v '4.3.0' --source 'https://rubygems.org/'
RUN gem install bundler:2.1.4

RUN bundle

COPY . .
RUN yarn install --check-files
EXPOSE 3000

ENTRYPOINT ["sh", "./config/docker/startup.sh"]