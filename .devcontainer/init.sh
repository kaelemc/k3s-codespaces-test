cd /
docker run --rm -v $(pwd):/workspace ghcr.io/oras-project/oras pull ghcr.io/kaelemc/k3s-zst
tar -xvf k3s.tar.zst
ls -lah