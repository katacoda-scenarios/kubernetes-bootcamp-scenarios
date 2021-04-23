ssh root@host01 "git clone https://github.com/OpenLiberty/sample-kubernetes-config.git"
ssh root@host01 "docker pull open-liberty:latest"

ssh root@host01 "while [ \`minikube status &>/dev/null; echo \$?\` -ne 0 ]; do sleep 1; done && kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080 && echo done >> /opt/katacoda-completed"
