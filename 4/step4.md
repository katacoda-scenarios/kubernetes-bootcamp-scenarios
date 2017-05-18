We can execute commands directly on the container. For this, we use the `exec` command and use the name of the Pod as a parameter. Let’s list the environment variables:

`kubectl exec $POD_NAME env`{{execute T2}}

Again, worth mentioning that the name of the container itself can be omitted in this case because we have only one running in the Pod.

Next let’s start a bash session in the Pod’s container:

`kubectl exec -ti $POD_NAME bash`{{execute T2}}

We have now an open console on the container where we run our NodeJS application.  The source code of the app is in the server.js file:

`cat server.js`{{execute T2}}

You can check that the application is up by running a curl command:

`curl localhost:8080`{{execute T2}}

*Note: here we used localhost because we executed the command inside the NodeJS container*

To close your container connection type `exit`{{execute T2}}.

