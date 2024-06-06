FROM python:2.7.18

RUN mkdir /root/.pip || true
COPY ./pip.conf /root/.pip/pip.conf

ENV PS1="\e[37;40m\]\[\e[32;40m\]\u\[\e[37;40m\]@\h:\[\e[36;40m\]\w\[\e[0m\n\$ "

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]
