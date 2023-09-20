FROM docker.io/opensuse/tumbleweed:latest

ADD ./tools/* /usr/local/bin/

RUN zypper in -y terraform butane git bind-utils vim
