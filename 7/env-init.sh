echo 'export POD_NAME=$(kubectl get pods -o go-template --template "{{range .items}}{{.metadata.name}}{{end}}")' >> /usr/bin/get_path
echo 'echo "POD name: $POD_NAME
 Path to app: http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/"' >> /usr/bin/get_path
echo 'curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/' >> /usr/bin/get_path
chmod +x /usr/bin/get_path
echo "done" >> /opt/katacoda-completed
