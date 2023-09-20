FROM docker.io/opensuse/tumbleweed:latest

ADD ./tools/* /usr/local/bin/

RUN zypper in -y terraform butane git bind-utils vim
# RUN cp /workspaces/openshift-okd/tools/* /usr/local/bin/
# RUN cp /workspaces/openshift-okd/install-config.yaml /workspaces/openshift-okd/ignition-configs/install-config.yaml