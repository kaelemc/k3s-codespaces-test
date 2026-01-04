systemctl start k3s
k3s ctr images import /images.tar && rm -rf images.tar
rm -rf playground
git clone https://github.com/kaelemc/playground 
cd playground
make download-tools
echo "export PATH=$PATH:/workspaces/k3s-codespaces-test/playground/tools" > /etc/profile.d/eda-tools.sh