#!/bin/bash
set -e

mount --make-rshared /

ln -sf /host-docker.sock /var/run/docker.sock

# for cg in $(find /sys/fs/cgroup/kubepods.slice -type d -name "cri-containerd-*" 2>/dev/null | sort -r); do
#   rmdir "$cg" 2>/dev/null || true
# done

# systemctl restart k3s

# until kubectl get nodes &>/dev/null; do
#   sleep 1
# done
# sleep 1

# kubectl delete --all pods -n eda-system --force