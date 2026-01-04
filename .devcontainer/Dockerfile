FROM registry.access.redhat.com/ubi9/ubi-init

RUN dnf install -y \
    iptables \
    kmod \
    make \
    git \
    hostname \
    zstd \
    jq \
    fuse-overlayfs \
    && dnf clean all

COPY k3s-config.yaml /etc/rancher/k3s/config.yaml

RUN dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf install -y docker-ce-cli && dnf clean all

RUN curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true INSTALL_K3S_SKIP_ENABLE=true sh -
RUN ln -sf /etc/systemd/system/k3s.service /etc/systemd/system/multi-user.target.wants/k3s.service
RUN mkdir -p /var/lib/rancher/k3s

WORKDIR /
COPY images.tar .
COPY cluster.tar.zst .

RUN tar -xvf cluster.tar.zst && rm /cluster.tar.zst