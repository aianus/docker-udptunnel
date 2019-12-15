FROM alpine

RUN mkdir /app
WORKDIR /app

RUN apk add --update \
  wget \
  build-base \
  libnsl-dev \
  tar && \
  wget http://www.cs.columbia.edu/~lennox/udptunnel/udptunnel-1.1.tar.gz && \
  tar -xf udptunnel-1.1.tar.gz && \
  cd udptunnel-1.1 && \
  ./configure && \
  make -j4 && \
  make install && \
  cd ../ && \
  rm -rf udptunnel* && \
  apk del \
  wget \
  build-base \
  tar && \
  rm -rf /var/cache/apk/*

COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
