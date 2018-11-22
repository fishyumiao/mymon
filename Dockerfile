# mymon: build
#
# docker build -t="fishyumiao/mymon" .

FROM golang:latest

# build mymon
RUN mkdir -p /go/src/github.com/open-falcon/mymon
RUN git clone https://github.com/open-falcon/mymon.git /go/src/github.com/open-falcon/mymon
RUN go get -u github.com/open-falcon/mymon
WORKDIR /go/src/github.com/open-falcon/mymon
RUN pwd
RUN make

# export skydns
RUN mkdir -p /mymon-binaries
RUN cp mymon /mymon-binaries/
VOLUME /mymon-binaries
