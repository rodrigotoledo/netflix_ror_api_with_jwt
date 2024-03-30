# Using the official Ruby image as base
FROM ruby:3.2.2

# Installing system dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Creating and setting up the working directory
RUN mkdir /app
WORKDIR /app

# Installing Rails gems
COPY Gemfile ./
RUN gem install bundler --version=2.5.6
RUN bundle install

# Copying the application code into the container
COPY . .

# Exposing port 3000 for application access
EXPOSE 3000

# Default command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
