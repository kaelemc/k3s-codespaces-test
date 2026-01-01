FROM mcr.microsoft.com/devcontainers/base:debian

# Install systemd and k3s dependencies
RUN apt-get update && apt-get install -y \
    systemd \
    systemd-sysv \
    dbus \
    iptables \
    iproute2 \
    kmod \
    btop \
    docker.io \
    fuse-overlayfs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remove unnecessary systemd services that might cause issues in container
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

# Install k3s (will be started via systemd)
RUN curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true sh -

# Configure k3s to work in container environment
COPY k3s-config.yaml /etc/rancher/k3s/config.yaml

# Set systemd as entrypoint
STOPSIGNAL SIGRTMIN+3
ENTRYPOINT ["/sbin/init"]
