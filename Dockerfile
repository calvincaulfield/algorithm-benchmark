FROM ruby:2.5

WORKDIR /usr/src/app
RUN apt update
RUN apt install -y nodejs

COPY Gemfile ./
RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install

COPY . .

CMD ["rails s"]