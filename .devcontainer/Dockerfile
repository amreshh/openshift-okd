FROM docker.io/opensuse/tumbleweed:latest

ADD ./tools/* /usr/local/bin/

RUN zypper in -y unzip terraform butane git bind-utils vim

# Install tflint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash