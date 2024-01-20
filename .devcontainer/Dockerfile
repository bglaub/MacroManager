FROM mcr.microsoft.com/devcontainers/base:jammy

RUN apt-get update \
    ## Install:
    ##    git and svn for release script
    ##    lua for luacheck
    && apt-get -y install git subversion lua5.2 liblua5.2 \
    ## Install luacheck for linting lua files
    && mkdir -p /tmp/luarocks \
    && cd /tmp/luarocks \
    && wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz \
    && tar zxpf luarocks-3.9.2.tar.gz \
    && cd luarocks-3.9.2 \
    && ./configure \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf luarocks \
    && luarocks install luacheck \
    ## Install yq for altering yaml
    && wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq \
    ## Install BigWigsPackager
    && cd /opt \
    && git clone https://github.com/BigWigsMods/packager.git BigWigsModsPackager

ENV MACRO_MANAGER_PACKAGER_PATH=/opt/BigWigsModsPackager
