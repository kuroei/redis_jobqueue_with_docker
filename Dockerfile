FROM ubuntu:latest
MAINTAINER YuanRui <kuroei.jp@gmail.comt>

RUN apt-get update && apt-get install -y -q curl git redis-server make \
		&& apt-get clean

ADD ./Redis-JobQueue-1.15 /usr/local/src/Redis-JobQueue-1.15

# Install go-resque
WORKDIR /usr/local/src/Redis-JobQueue-1.15
RUN make
RUN make test
RUN make install

CMD redis-jobqueue
