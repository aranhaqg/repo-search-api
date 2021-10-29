FROM ruby:2.7.2

# COMMONS
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn

# PROJECT
ENV DIR /repo-search-api
RUN mkdir ${DIR}
COPY . ${DIR}

WORKDIR ${DIR}

ADD Gemfile ${DIR}/Gemfile
ADD Gemfile.lock ${DIR}/Gemfile.lock
RUN yarn install --check-files
RUN gem install bundler
RUN bundle install

RUN groupadd --gid 1000 -r nonroot && useradd --uid 1000 --no-log-init -r -g nonroot nonroot

EXPOSE 3000
