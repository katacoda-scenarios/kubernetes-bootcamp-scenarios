By default deployed applications are visible only inside the Kubernetes cluster. Exposing our application externally will be covered in Module 4. To view the application output without exposing it externally, we’ll create a route between our terminal and the Kubernetes cluster using a proxy:

`kubectl proxy`{{execute}}

We now have a connection between our host (the online terminal) and the Kubernetes cluster. The started proxy enables direct access to the API. The app runs inside a Pod (we'll cover the Pod concept in next module). 
Get the name of the Pod and store it in the POD_NAME environment variable:


`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T2}}

To see the output of our application, run a curl request:

`curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/`{{execute T2}}

The url is the route to the API of the Pod.

*Note: Check the top of the terminal. The last 2 commands were executed in a new tab (Terminal 2). The proxy still runs in the first tab, and this allowed our curl command to work using localhost.*

