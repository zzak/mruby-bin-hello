FROM ubuntu:14.04

RUN apt-get update -qq --fix-missing
RUN apt-get install -y build-essential dpkg curl wget
RUN apt-get install -y wget git-core subversion autoconf bison ruby
RUN apt-get install -y openssl libssl-dev libyaml-dev zlib1g-dev libreadline-dev libcurl4-openssl-dev

# Download TerenceRuby
RUN mkdir -p /opt/rubies/2.2.2
RUN curl https://s3-external-1.amazonaws.com/heroku-buildpack-ruby/cedar-14/ruby-2.2.2.tgz --silent -L | tar -xzC /opt/rubies/2.2.2
# Prepend TerenceRuby to PATH
ENV PATH /opt/rubies/2.2.2/bin:$PATH

RUN mkdir -p /source
WORKDIR /source

# Setup OSX cross-compiler
RUN git clone git://github.com/tpoechtrager/osxcross.git
RUN /source/osxcross/tools/get_dependencies.sh
COPY tarballs/Mac*.tar* osxcross/tarballs/
ENV SDK_VERSION 10.10
ENV UNATTENDED 1
RUN /source/osxcross/build.sh
ENV PATH /source/osxcross/target/bin:$PATH

# Install MinGW-w64
RUN apt-get install -y mingw-w64

RUN mkdir -p /build
WORKDIR /build
