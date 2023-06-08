FROM ruby:3.2.1

ENV RAILS_ENV production

ADD . /app
WORKDIR /app
RUN bundle install && bundle exec rails assets:precompile assets:clean

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]