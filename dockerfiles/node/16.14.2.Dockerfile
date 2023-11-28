FROM node:16.14.2
LABEL maintainer="iamhuide@google.com"

# 国内镜像
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/ && npm config get registry

# 安装 pm2
RUN npm install pm2 -g \
    && npm install pnpm -g

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]