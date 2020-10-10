FROM ruby:2.7.1

WORKDIR /tester

COPY ./Gemfile* ./

RUN bundle install

COPY ./ ./

CMD ["rspec"]
