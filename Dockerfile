FROM ruby:3.1

RUN apt-get update -yqq

RUN apt-get install -yqq \
  build-essential \
  ca-certificates 

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

COPY . /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

CMD ["rails", "s", "-b", "0.0.0.0"]

