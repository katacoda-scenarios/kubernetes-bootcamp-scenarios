~/.bin/minikube start
kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080 --replicas=4
kubectl expose deployments/kubernetes-bootcamp --type="NodePort" --port 8080
echo "done" >> /opt/katacoda-completed
