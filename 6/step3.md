Let’s perform another update, and deploy an image tagged with `v10` :

`kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10`{{execute}}

Use `get deployments` to see the status of the deployment:

`kubectl get deployments`{{execute}}

Notice that the output doesn't list the desired number of available Pods. Run the `get pods` command to list all Pods:

`kubectl get pods`{{execute}}

Notice that some of the Pods have a status of `ImagePullBackOff`. 

To get more insight into the problem, run the `describe pods` command:

`kubectl describe pods`{{execute}}

In the `Events` section of the output for the affected Pods, notice that the `v10` image version did not exist in the repository.

To roll back the deployment to your last working version, use the `rollout undo` command:

`kubectl rollout undo deployments/kubernetes-bootcamp`{{execute}}

The `rollout undo` command reverts the deployment to the previous known state (v2 of the image). Updates are versioned and you can revert to any previously known state of a deployment. 

Use the `get pods` commands to list the Pods again:

`kubectl get pods`{{execute}}

Four Pods are running. To check the image deployed on these Pods, use the `describe pods` command:

`kubectl describe pods`{{execute}}

The deployment is once again using a stable version of the app (v2). The rollback was successful.
