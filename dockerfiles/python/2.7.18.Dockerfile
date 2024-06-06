FROM python:2.7.18

RUN mkdir /root/.pip || true
COPY ./pip.conf /root/.pip/pip.conf

RUN echo 'PS1="\[\e[37m\]\[\e[32m\]\u\[\e[37m\]@\h:\[\e[36m\]\w\[\e[0m\n\$ "' >> ~/.bashrc

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]
