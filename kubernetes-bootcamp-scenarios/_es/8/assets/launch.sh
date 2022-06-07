echo "Iniciando Kubernetes 1.15.0. Esto puede tomar unos minutos, por favor espere..."
while [ `minikube status &>/dev/null; echo $?` -ne 0 ]; do sleep 1; done
echo "Kubernetes Iniciado"
