FROM golang:1.18
LABEL maintainer="iamhuide@google.com"


ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    GIN_MODE=release \
    PORT=80

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]