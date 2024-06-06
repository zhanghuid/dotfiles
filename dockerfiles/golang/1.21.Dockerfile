FROM golang:1.21
LABEL maintainer="iamhuide@google.com"


ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    GIN_MODE=release \
    PORT=80

ENV PS1="\e[37;40m\]\[\e[32;40m\]\u\[\e[37;40m\]@\h:\[\e[36;40m\]\w\[\e[0m\n\$ "

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]