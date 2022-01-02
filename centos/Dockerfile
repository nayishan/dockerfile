FROM centos

ARG USER=root
ARG PGCONFIG=/root/config
ARG PREPGCODE=/root/gitCode
ARG PGCODE=${PREPGCODE}/postgres
ARG LOG=/root/log
ARG RELEASE=/root/pgrelease
ARG MNTCODE=/mnt/postgres
ARG MNTCONFIG=/mnt/config


RUN set -ex \
&& yum install -y gcc \
    sudo \
    which \
    passwd \
    readline-devel \
    openssh-clients \
    openssh-server \
    make \
    flex \
    zlib-dev \
    openssl
&& echo root:111111 | chpasswd \
&& ssh-keygen -t rsa -P "" -f "/etc/ssh/ssh_host_rsa_key" \
&& ssh-keygen -t ecdsa -P "" -f "/etc/ssh/ssh_host_ecdsa_key" \
&& ssh-keygen -t ed25519 -P "" -f "/etc/ssh/ssh_host_ed25519_key" \
#&& useradd ${USER} \
#&& su - ${USER} \
&& mkdir ${PREPGCODE} \
#&& mkdir ${PGCONFIG} \
&& mkdir ${LOG} \
&& mkdir ${RELEASE} \
&& mkdir ${MNTCODE} \
&& mkdir ${MNTCONFIG} \
&& ssh-keygen -t rsa -P "" -f "${HOME}/.ssh/id_rsa" \
&& ln -s ${MNTCODE} ${PGCODE} \
&& ln -s ${MNTCONFIG} ${PGCONFIG} \
