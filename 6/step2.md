First, let’s check that the App is running. To find out the exposed IP and Port we can use `describe service`:

`kubectl describe services/kubernetes-bootcamp`{{execute}}

Create an environment variable called NODE_PORT that has the value of the Node port assigned:

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

Next, we’ll do a `curl` to the the exposed IP and port:

`curl $(minikube ip):$NODE_PORT`{{execute}}

We hit a different Pod with every request and we see that all Pods are running the latest version (v2).

The update can be confirmed also by running a rollout status command:

`kubectl rollout status deployments/kubernetes-bootcamp`{{execute}}

To view the current image version of the app, run a describe command against the Pods:

`kubectl describe pods`{{execute}}

We run now version 2 of the app (look at the Image field)
