FROM debian:latest

# install tools
RUN apt update && apt upgrade -y && \
    apt install vim nano openssh-server -y;

# setup ssh
RUN sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config; \
    service ssh start;

# setup problems
RUN echo root:test | chpasswd;


CMD ["/usr/sbin/sshd","-D","-e"]

