FROM registry.access.redhat.com/ubi9/ubi-init

ARG ORAS_VERSION="1.3.0"

RUN dnf install -y \
    iptables \
    kmod \
    make \
    git \
    hostname \
    zstd \
    fuse-overlayfs \
    && dnf clean all

COPY k3s-config.yaml /etc/rancher/k3s/config.yaml

RUN dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf install -y docker-ce-cli && dnf clean all

RUN curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true INSTALL_K3S_SKIP_ENABLE=true sh -
RUN ln -sf /etc/systemd/system/k3s.service /etc/systemd/system/multi-user.target.wants/k3s.service

RUN curl -LO "https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz" && \
    mkdir -p oras-install/ && \
    tar -zxf oras_$ORAS_VERSION*.tar.gz -C oras-install/ && \
    mv oras-install/oras /usr/local/bin/ && \
    rm -rf oras_$ORAS_VERSION*.tar.gz oras-install/

WORKDIR /
# RUN oras pull ghcr.io/kaelemc/k3s-zst:latest
COPY k3s.tar.zst /k3s.tar.zst

RUN mkdir -p /var/lib/rancher/k3s



