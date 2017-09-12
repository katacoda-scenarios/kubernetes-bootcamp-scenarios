Pods that are running inside Kubernetes are running on a private, isolated network. 
By default they are visible from other pods and services within the same kubernetes cluster, but not outside that network.
When we use `kubectl`, we're interacting through an API endpoint to communicate with our application. 
This is how we can deploy the application, get logs, etc.

We will cover other options on how to expose your application outside the kubernetes cluster in Module 4.

`kubectl` includes the ability the create a temporary, active proxy that will forward communications into the cluster-wide, private network. 
Running the proxy will "take up a terminal window"; when it is invoked, it will report that it's forwarding traffic, but you won't otherwise see anything from the proxy command.
The proxy is meant to be temporary only, and when you quit the command (for example, by pressing "control-C" to exit it), the proxy will stop.

In this online tutorial, we can have multiple terminal windows open. 
If you are doing this on your own computer with minikube, then open a second terminal window so we can run both the proxy command and other kubectl commands.
In the terminal window that is visible we will activate the proxy, and use a second terminal to continue to use kubectl to communicate with our application. 

`kubectl proxy`{{execute}}

We now have a connection between our host (the online terminal) and the Kubernetes cluster. The started proxy enables direct access to the API. 

Now we can open a second terminal window, and get the name of the Pod and store it in the POD_NAME environment variable:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T2}}

With the proxy active, we can also now use `curl` to interact with our application. 
The API server will automatically create an endpoint for each pod, based on the pod name, that is accessible through the proxy.

To see the output of our application, run a curl request:

`curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/`{{execute T2}}

The url is the route to the API of the Pod.

*Note: Check the top of the terminal. The last 2 commands were executed in a new tab (Terminal 2). The proxy still runs in the first tab, and this allowed our curl command to work using localhost.*
