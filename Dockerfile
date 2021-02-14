FROM ruby:2.6.5

RUN apt-get update && \
    apt-get install -y default-mysql-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /myproject

WORKDIR /myproject

ADD Gemfile /myproject/Gemfile
ADD Gemfile.lock /myproject/Gemfile.lock

RUN gem install bundler
RUN bundle install

#既存railsプロジェクトをコンテナ内にコピー
COPY . /myproject
CMD ["rails", "server", "-b", "0.0.0.0"] 