FROM ruby:2.7.1

RUN mkdir /eschop
WORKDIR /eschop

RUN gem install bundler -v 2.1.4
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --retry 3

COPY . .
CMD ["bundle","exec","rails","server"]