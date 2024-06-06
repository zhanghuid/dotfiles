FROM node:8.9.0
LABEL maintainer="iamhuide@google.com"

# 国内镜像
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/ && npm config get registry

# 安装 pm2
RUN npm install pm2 -g \
    && npm install pnpm -g

ENV PS1="\e[37;40m\]\[\e[32;40m\]\u\[\e[37;40m\]@\h:\[\e[36;40m\]\w\[\e[0m\n\$ "

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]