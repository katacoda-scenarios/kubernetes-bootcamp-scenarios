~/.bin/minikube start
kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080
kubectl expose deployments/kubernetes-bootcamp --type="NodePort" --port 8080
echo "done" >> /opt/katacoda-completed
