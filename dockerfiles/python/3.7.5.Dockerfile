FROM python:3.7.5

RUN mkdir /root/.pip || true
COPY ./pip.conf /root/.pip/pip.conf

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]
