To list your deployments, run the `get deployments` command:
`kubectl get deployments`{{execute}}

To list the running Pods, run the `get pods` command:

`kubectl get pods`{{execute}}

To view the current image version of the app, run the `describe pods` command
and look for the `Image` field:

`kubectl describe pods`{{execute}}

To update the image of the application to version 2, use the `set image` command, followed by the deployment name and the new image version:

`kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2`{{execute}}

The command notified the Deployment to use a different image for your app and initiated a rolling update. Check the status of the new Pods, and view the old one terminating with the `get pods` command:

`kubectl get pods`{{execute}}

