systemctl start k3s
kubectl delete --all pods --namespace=eda-demo
kubectl uncordon eda-demo