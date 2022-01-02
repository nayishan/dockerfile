FROM rastasheep/ubuntu-sshd

ARG USER=root
ARG PGCONFIG=/root/config
ARG PREPGCODE=/root/gitCode
ARG PGCODE=${PREPGCODE}/postgres
ARG LOG=/root/log
ARG RELEASE=/root/pgrelease
ARG MNTCODE=/mnt/postgres
ARG DEBIAN_FRONTEND=noninteractive
#ARG SSHD=/run/sshd
COPY pgconfig ${PGCONFIG}
 
RUN set -ex \
&&  apt update -y \
&&  apt install -y software-properties-common \
&&  apt-add-repository ppa:neovim-ppa/unstable \
&&  apt update -y \
&&  apt install -y neovim \ 
    libterm-readkey-perl \
    dialog \
    apt-utils \
&&  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
&&  apt update && apt upgrade -y \
&&  apt install -y \
    passwd \
    openssh-client \
    openssh-server \
    openssl \
    gcc \
    libreadline-dev \
    make \
    flex \
    zlib1g-dev \
    net-tools \
    inetutils-ping \
    libssh-dev \
    libxml2-dev \
    uuid-dev \
    gettext \
    bear \
    bison \
    libxml2-utils \
    xsltproc \
    docbook-xsl \
    docbook-xml \ 
&& echo root:111111 | chpasswd \
#&& ssh-keygen -t rsa -P "" -f "/etc/ssh/ssh_host_rsa_key" \
#&& ssh-keygen -t ecdsa -P "" -f "/etc/ssh/ssh_host_ecdsa_key" \
#&& ssh-keygen -t ed25519 -P "" -f "/etc/ssh/ssh_host_ed25519_key" \
&& mkdir ${PREPGCODE} \
#&& mkdir ${PGCONFIG} \
&& mkdir ${LOG} \
&& mkdir ${RELEASE} \
&& mkdir ${MNTCODE} \
&& echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \ 
&& ln -s ${MNTCODE} ${PGCODE} \
&& chmod +x ${PGCONFIG}/initbashrc.sh \
&& /root/config/initbashrc.sh
