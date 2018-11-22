# mymon: build
#
# docker build -t="fishyumiao/mymon" .

FROM golang:1.3.3

# build mymon
RUN mkdir -p /go/src/github.com/open-falcon/mymon
RUN git clone https://github.com/open-falcon/mymon.git /go/src/github.com/open-falcon/mymon
RUN go get github.com/open-falcon/mymon
WORKDIR /go/src/github.com/open-falcon/mymon
RUN pwd
RUN go build -v

# export skydns
RUN mkdir -p /mymon-binaries
RUN cp mymon /mymon-binaries/
VOLUME /mymon-binaries
