Let’s view the cluster details. We’ll do that by running *kubectl cluster-info*:

`kubectl cluster-info`{{execute}}

We have a running master and a dashboard. The Kubernetes dashboard allows you to view your applications in a UI. During this tutorial, we’ll be focusing on the command line for deploying and exploring our application.
To view the nodes in the cluster, run the *kubectl get nodes* command:

`kubectl get nodes`{{execute}}

This command shows all nodes that can be used to host our applications. Now we have only one node, and we can see that it’s status is ready (it is ready to accept applications for deployment). 

