FROM golang:1.21
LABEL maintainer="iamhuide@google.com"


ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    GIN_MODE=release \
    PORT=80

RUN echo 'PS1="\[\e[37m\]\[\e[32m\]\u\[\e[37m\]@\h:\[\e[36m\]\w\[\e[0m\n\$ "' >> ~/.bashrc

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]