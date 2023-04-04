# Base image
FROM ruby:3.2.2-bullseye
RUN apt update && apt install -y nodejs && apt install -y yarn
ENV RAILS_ENV=development
ENV NODE_ENV=development
ENV RAILS_SERVE_STATIC_FILES=true
ENV DATABASE_URL=postgres://postgres:password@db:5432/sahki_rails_development
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . .
# RUN yarn install --check-files
# RUN rails assets:precompile
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
