echo "Memulai Kubernetes 1.15.0. Ini akan membutuhkan beberapa saat, harap tunggu..."
while [ `minikube status &>/dev/null; echo $?` -ne 0 ]; do sleep 1; done
echo "Kubernetes dimulai"
