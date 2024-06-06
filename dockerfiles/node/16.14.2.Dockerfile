FROM node:16.14.2
LABEL maintainer="iamhuide@google.com"

# 国内镜像
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/ && npm config get registry

# 安装 pm2
RUN npm install pm2 -g \
    && npm install pnpm -g

RUN echo 'PS1="\[\e[37m\]\[\e[32m\]\u\[\e[37m\]@\h:\[\e[36m\]\w\[\e[0m\n\$ "' >> ~/.bashrc

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]