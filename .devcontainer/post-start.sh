systemctl start k3s
kubectl delete --all pods --namespace=eda-system
kubectl uncordon eda-demo