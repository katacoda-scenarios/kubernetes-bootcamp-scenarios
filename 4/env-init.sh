~/.bin/minikube start
kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080
echo "done" >> /opt/katacoda-completed
