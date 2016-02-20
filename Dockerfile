FROM ruby:2.1
MAINTAINER chris elliott

ADD sparkle /sparkle
RUN cd /sparkle && bundle install && bundle exec sfn conf --generate
RUN gem install aws-sdk

CMD ["/bin/bash", "-l"]