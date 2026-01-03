cd /
docker run --rm -v $(pwd):/workspace ghcr.io/oras-project/oras:v1.3.0 pull ghcr.io/kaelemc/k3s-zst:latest
tar -xf k3s.tar.zst
rm -f k3s.tar.zst
ls -lah