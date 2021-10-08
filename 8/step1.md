Let’s verify that the application is running. You’ll use the `kubectl get` command and look for existing Pods:

`kubectl get pods`{{execute}}

If no pods are running then it means the interactive environment is still reloading its previous state. Please wait a couple of seconds and list the Pods again. You can continue once you see the one Pod running.

Next, list the current Services from the cluster:

`kubectl get services`{{execute}}

You can see a Service called `kubernetes`. That `kubernetes` Service, in the default namespace, is created and managed by Kubernetes itself.
To create a new Service and expose it to external traffic, you’ll use the `kubectol expose` command with NodePort as parameter (minikube also supports `LoadBalancer` as a service type, but that requires <a href="https://minikube.sigs.k8s.io/docs/handbook/accessing/#loadbalancer-access" target="_blank">extra configuration</a>).

Here's what to run:

`kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080`{{execute}}

Now, list Services again:

`kubectl get services`{{execute}}

You can now see a new Service called _kubernetes-bootcamp_). You can see from the `kubectl` output that it's a `NodePort` Service and that Kubernetes has assigned a “cluster IP” specifically for that Service. You can also see that there is a port assignment, mapping an allocated port to port 80 in the container.

Another way to see the port allocation is to run:

`kubectl describe service kubernetes-bootcamp`{{execute}}

The output includes the target port and the allocated node port, along with other details.

For some of the next steps, you need to use that node port.
To make things easier, define an environment variable called
`NODE_PORT` that has the value of the Node port assigned.

You can do that by running:

`export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')"
echo NODE_PORT="${NODE_PORT}"`{{execute}}

Now you can test that the app is exposed outside of the cluster using `curl`, the IPv4 address of the Node, and the externally exposed port:

`curl "http://$(minikube ip):$NODE_PORT"`{{execute}}

And you do see a response from the server (the `kubernetes-bootcamp` Pod
that the Deployment started for you). Seeing that HTTP response message
confirms that the Deployment is exposed as a Service.
