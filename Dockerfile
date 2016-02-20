FROM ruby:2.1
MAINTAINER chris elliott

RUN apt-get update && apt-get install -y vim

ADD sparkle /sparkle
RUN cd /sparkle && bundle install && bundle exec sfn conf --generate

CMD ["/bin/bash", "-l"]
