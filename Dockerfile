#Name:		openthings/ubuntu-golang:ARM64
#Base:		openthings/ubuntu-rock
#Source:	github.com/openthings/ubuntu-golang

FROM openthings/ubuntu-rock:ARM64
MAINTAINER openthings <openthings@163.com>

# Install go 1.7.4
ENV GO_VERSION=1.7.4

WORKDIR /opt
RUN wget --no-check-certificate https://storage.googleapis.com/golang/go$GO_VERSION.src.tar.gz && \
    tar zxvf go$GO_VERSION.src.tar.gz && \
    rm go$GO_VERSION.src.tar.gz

WORKDIR /opt/go/src
RUN GOROOT_BOOTSTRAP=$(go env GOROOT) GOOS=linux GOARCH=arm64 ./make.bash

WORKDIR /opt

# env variables
RUN mkdir /go
ENV GOROOT /opt/go
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN apt-get update && \
    apt-get -y install git-core

# Define default command
CMD ["bash"]
