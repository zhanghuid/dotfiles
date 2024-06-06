FROM nginx:1.12.0
LABEL maintainer="iamhuide@google.com"

RUN echo 'PS1="\[\e[37m\]\[\e[32m\]\u\[\e[37m\]@\h:\[\e[36m\]\w\[\e[0m\n\$ "' >> ~/.bashrc

WORKDIR /work/web

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]