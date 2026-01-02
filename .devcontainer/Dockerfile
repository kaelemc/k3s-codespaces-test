FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install k3s dependencies
RUN apt-get update && apt-get install -y \
    iptables \
    iproute2 \
    kmod \
    btop \
    fuse-overlayfs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install k3s
RUN curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true sh -

# Configure k3s
COPY k3s-config.yaml /etc/rancher/k3s/config.yaml

# Install k3s init script
COPY k3s-init /etc/init.d/k3s
RUN chmod +x /etc/init.d/k3s
