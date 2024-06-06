FROM nginx:1.12.0
LABEL maintainer="iamhuide@google.com"

ENV PS1="\e[37;40m\]\[\e[32;40m\]\u\[\e[37;40m\]@\h:\[\e[36;40m\]\w\[\e[0m\n\$ "

WORKDIR /work/web

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]