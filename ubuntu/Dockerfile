FROM rastasheep/ubuntu-sshd

ARG USER=root
ARG PGCONFIG=/root/config
ARG PREPGCODE=/root/gitCode
ARG PGCODE=${PREPGCODE}/postgres
ARG ONECODE=/root/onethreadoneepoll
ARG LOG=/root/log
ARG RELEASE=/root/pgrelease
ARG MNTCODE=/mnt/code
ARG DEBIAN_FRONTEND=noninteractive
ARG MNTNVIM=/mnt/config
ARG NVIM=/root/.config
#ARG SSHD=/run/sshd
COPY pgconfig ${PGCONFIG}
 
RUN set -ex \
#&&  export https_proxy=http://host.docker.internal:8118 \
#&&  export http_proxy=http://host.docker.internal:8118 \
&&  apt update -y \
&&  apt install -y software-properties-common \
&&  apt-add-repository ppa:neovim-ppa/unstable \
&&  apt update -y \
&&  apt install -y neovim \ 
    locales-all \
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
    git \
    lua5.1 \
    libsqlite3-dev \
    vim \
    curl \
    zip \
    automake \
    autoconf \
    libtool \
    clang \
    clangd-10 \
    libncurses5-dev \
    texinfo \
    cgdb \
&& echo root:111111 | chpasswd \
#&& ssh-keygen -t rsa -P "" -f "/etc/ssh/ssh_host_rsa_key" \
#&& ssh-keygen -t ecdsa -P "" -f "/etc/ssh/ssh_host_ecdsa_key" \
#&& ssh-keygen -t ed25519 -P "" -f "/etc/ssh/ssh_host_ed25519_key" \
&& mkdir ${PREPGCODE} \
#&& mkdir ${PGCONFIG} \
&& mkdir ${LOG} \
&& mkdir -p ${NVIM} \
&& mkdir ${RELEASE} \
&& mkdir ${MNTCODE} \
&& mkdir ${MNTNVIM} \
&& echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \ 
&& ln -s ${MNTCODE}/postgres ${PREPGCODE}/postgres \
&& ln -s ${MNTNVIM}/mynvim ${NVIM}/nvim \
&& ln -s ${MNTCODE}/onethreadoneepoll ${ONECODE} \
&& ln -s /usr/bin/clangd-10 /usr/bin/clangd \
&& chmod +x ${PGCONFIG}/initbashrc.sh \
&& /root/config/initbashrc.sh \
&&  echo "alias setproxy=\"export https_proxy=http://host.docker.internal:8118; export http_proxy=http://host.docker.internal:8118; export all_proxy=socks5://host.docker.internal:8119; echo 'Set proxy successfully'\"" >> /root/.bashrc 
&& curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb \
&& dpkg -i ripgrep_13.0.0_amd64.deb
#&& echo "export XDG_CONFIG_HOME=/root/.config" >>/root/.bashrc \
#&& echo "export XDG_DATA_HOME=/root/.config/nvim/data" >>/root/.bashrc
