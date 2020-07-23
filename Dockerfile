FROM ubuntu:20.04 AS build

ARG GIT_URL="https://github.com/pinheadmz/hnsd.git"
ARG GIT_BRANCH="maintest1"
ENV GIT_URL=${GIT_URL}
ENV GIT_BRANCH=${GIT_BRANCH}
ENV APT_ARGS="-y -o APT::Install-Suggests=false -o APT::Install-Recommends=false"

WORKDIR /src
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install ${APT_ARGS} build-essential git automake autoconf libtool libunbound-dev ca-certificates && \
    git clone ${GIT_URL} /src && \
    git checkout ${GIT_BRANCH} && \
    ./autogen.sh && ./configure && make && make install && \
    mv hnsd /usr/local/bin && \
    apt-get clean

ENTRYPOINT ["hnsd"]
