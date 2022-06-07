We can execute commands directly on the container once the Pod is up and running.
For this, we use the `exec` command and use the name of the Pod as a parameter. Let’s list the environment variables:

`kubectl exec $POD_NAME -- env`{{execute T1}}

Again, worth mentioning that the name of the container itself can be omitted since we only have a single container in the Pod.

Next let’s start a bash session in the Pod’s container:

`kubectl exec -ti $POD_NAME -- bash`{{execute T1}}

We have now an open console on the container where we run our NodeJS application.  The source code of the app is in the server.js file:

`cat server.js`{{execute T1}}

You can check that the application is up by running a curl command:

`curl localhost:8080`{{execute T1}}

*Note: here we used localhost because we executed the command inside the NodeJS Pod. If you cannot connect to localhost:8080, check to make sure you have run the kubectl exec command and are launching the command from within the Pod*

To close your container connection type `exit`{{execute T1}}.
