~/.bin/minikube start
echo 'export POD_NAME=$(kubectl get pods -o go-template --template "{{range .items}}{{.metadata.name}}{{end}}")' >> ~/.bin/get_path
echo 'echo "POD name: $POD_NAME
 Path to app: http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/"' >> ~/.bin/get_path
echo 'curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/' >> ~/.bin/aget_path
chmod +x ~/.bin/get_path
