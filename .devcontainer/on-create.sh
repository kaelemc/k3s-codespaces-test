# git clone https://github.com/kaelemc/playground && cd playground
# make download-tools
tar --exclude='*/io.containerd.snapshotter.v1.overlayfs/*' -xf /k3s.tar.zst -C /var/lib/rancher/k3s --strip-components=1
rm -f /k3s.tar.zst
ls -lah /var/lib/rancher/k3s
echo "export PATH=$PATH:/workspaces/k3s-codespaces-test/playground/tools" > /etc/profile.d/eda-tools.sh