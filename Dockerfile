FROM ruby:3.2.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4567

CMD ["ruby", "./app.rb"]