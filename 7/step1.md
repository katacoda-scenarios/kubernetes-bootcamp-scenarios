Like minikube, kubectl comes installed in the online terminal. Type kubectl in the terminal to see its usage.
The common format of a kubectl command is: kubectl action resource.
This performs the specified action (like create, describe) on the specified resource (like node, container). You can use `--help` after the command to get additional info about possible parameters (`kubectl get nodes --help`).

Check that kubectl is configured to talk to your cluster, by running the `kubectl version` command:

`kubectl version`{{execute}}

OK, kubectl is installed and you can see both the client and the server versions.

To view the nodes in the cluster, run the `kubectl get nodes` command:

`kubectl get nodes`{{execute}}

Here we see the available nodes (1 in our case). Kubernetes will choose where to deploy our application based on Node available resources.
