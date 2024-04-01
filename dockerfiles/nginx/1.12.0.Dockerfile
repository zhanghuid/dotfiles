FROM nginx:1.12.0
LABEL maintainer="iamhuide@google.com"

WORKDIR /work/web

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]