git clone https://github.com/jamiecoleman92/guide-kubernetes-microprofile-config.git
docker pull open-liberty:latest

ssh root@host01 "while [ \`minikube status &>/dev/null; echo \$?\` -ne 0 ]; do sleep 1; done && kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080 && echo done >> /opt/katacoda-completed"