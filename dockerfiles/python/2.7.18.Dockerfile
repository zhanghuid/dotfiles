FROM python:2.7.18

RUN mkdir /root/.pip || true
COPY ./pip.conf /root/.pip/pip.conf

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]
