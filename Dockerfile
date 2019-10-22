FROM ruby:2.6-stretch
MAINTAINER BULA3-1992 <BULA3@MAIL.RU>

# Можно поменять значение S_K_B
ENV SECRET_KEY_BASE=d4e74f017910ac56c6ebad01165b7e1b37f4c9c02e9716836f8670cdc8d65a231e64e4f6416b19c8
ENV NODE_VERSION="11.0.0"
ENV BUNDLER_VERSION="2.0.1"
ENV APP_USER app
ENV APP_PATH /usr/src/app

# install node + npm
RUN curl https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz | tar xzf - -C /usr/local --strip-components=1

RUN apt-get update -qq && \
	apt-get redis-server -y

# using /home/app since npm cache and other stuff will be put there when running npm install
# we don't want to pollute any locally-mounted directory
RUN useradd -d /home/$APP_USER -m $APP_USER
RUN gem install bundler --version "${bundler_version}" --no-document

WORKDIR $APP_PATH

COPY Gemfile ./Gemfile
COPY Gemfile.* ./

RUN bundle install

# Then, npm install node modules
COPY package.json /tmp/npm/package.json
COPY frontend/*.json /tmp/npm/frontend/
RUN cd /tmp/npm/frontend/ && RAILS_ENV=production npm install && mv /tmp/npm/frontend /usr/src/app/

# Finally, copy over the whole thing
COPY . /usr/src/app
RUN cp docker/Procfile .

CMD ["./docker/web"]
ENTRYPOINT ["./docker/entrypoint.sh"]
