k3s-killall.sh
tar --exclude='*/io.containerd.snapshotter.v1.overlayfs/*' -xf /k3s.tar.zst -C /var/lib/rancher/k3s --strip-components=1
rm -f /k3s.tar.zst
systemctl start k3s
ls -lah /var/lib/rancher/k3s