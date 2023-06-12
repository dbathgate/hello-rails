FROM ruby:3.2.1

ENV RAILS_ENV production

RUN useradd appuser

ADD --chown=1000:1000 . /app

WORKDIR /app
USER appuser

RUN bundle install && bundle exec rails assets:precompile assets:clean

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]