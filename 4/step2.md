Let’s refresh some of the knowledge gained in the previous chapter. By default, all pods are visible only inside the cluster. To access applications from our localhost, we need to create a proxy between our machine and the Kubernetes cluster with the proxy command:

`kubectl proxy`{{execute}}

The _proxy_ command runs in the foreground. All future commands are run in a separate terminal. Clicking the command will open a new terminal tab.

Get the name of the Pod (in a new terminal window) and store it in the POD_NAME environment variable:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T2}}

To see the output of our application, run a `curl` request.

`curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/`{{execute T2}}

The url is the route to the API of the Pod.
