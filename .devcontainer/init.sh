cd /
docker run --rm -v $(pwd):/workspace ghcr.io/oras-project/oras:v1.3.0 pull ghcr.io/kaelemc/k3s-zst
tar -xf k3s.tar.zst
ls -lah