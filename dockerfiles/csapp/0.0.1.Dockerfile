FROM iamhuid-docker.pkg.coding.net/learn/centos/csapp:0.0.1

RUN echo 'PS1="\[\e[37m\]\[\e[32m\]\u\[\e[37m\]@\h:\[\e[36m\]\w\[\e[0m\n\$ "' >> ~/.bashrc

WORKDIR /work/web

ENTRYPOINT ["tail", "-f", "/dev/null"]
