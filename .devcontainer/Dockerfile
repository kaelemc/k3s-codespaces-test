FROM rancher/k3s AS importer

COPY tars/ /tmp/tars

RUN mkdir -p /run/containerd /var/lib/rancher/k3s/agent/containerd && \
    cat > /tmp/containerd.toml <<'EOF'
version = 2
root = "/var/lib/rancher/k3s/agent/containerd"
state = "/run/containerd"
[grpc]
  address = "/run/containerd/containerd.sock"
EOF

RUN containerd -c /tmp/containerd.toml & \
    sleep 3 && \
    for tar in /tmp/tars/*.tar; do \
        echo "==> Importing: $tar"; \
        ctr -a /run/containerd/containerd.sock -n k8s.io images import --no-unpack "$tar"; \
    done && \
    kill %1 2>/dev/null || true && \
    sleep 1 && \
    rm -rf /tmp/tars /tmp/containerd.toml /run/containerd

# Final
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

COPY --from=importer /var/lib/rancher/k3s/agent/containerd/io.containerd.content.v1.content /var/lib/rancher/k3s/agent/containerd/io.containerd.content.v1.content
COPY --from=importer /var/lib/rancher/k3s/agent/containerd/io.containerd.metadata.v1.bolt /var/lib/rancher/k3s/agent/containerd/io.containerd.metadata.v1.bolt