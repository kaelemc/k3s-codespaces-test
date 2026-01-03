#!/bin/bash
set -e

mount --make-rshared /
ln -sf /host-docker.sock /var/run/docker.sock

systemctl stop k3s
rm -rf /var/lib/rancher/k3s/*
tar -xf /k3s.tar.zst -C /var/lib/rancher/k3s --strip-components=1
rm -f /k3s.tar.zst

for cg in $(find /sys/fs/cgroup/kubepods.slice -type d -name "cri-containerd-*" 2>/dev/null | sort -r); do
  rmdir "$cg" 2>/dev/null || true
done

systemctl start k3s

until kubectl get nodes &>/dev/null; do
  sleep 1
done
sleep 1

kubectl delete --all pods -n eda-system --force