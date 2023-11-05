FROM ruby:alpine
WORKDIR /app
COPY Gemfile* yaml2ics ./
RUN bundle install
WORKDIR /data
ENTRYPOINT ["/app/yaml2ics"]
