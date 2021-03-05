To delete Services you can use the `delete service` command. Labels can be used also here:

`kubectl delete service -l app=kubernetes-bootcamp`{{execute}}

Confirm that the service is gone:

`kubectl get services`{{execute}}

This confirms that our Service was removed. To confirm that route is not exposed anymore you can `curl` the previously exposed IP and port:

`curl $(minikube ip):$NODE_PORT`{{execute}}

This proves that the app is not reachable anymore from outside of the cluster.
You can confirm that the app is still running with a curl inside the pod:

`kubectl exec -ti $POD_NAME -- curl localhost:8080`{{execute}}

We see here that the application is up. This is because the Deployment is managing the application. To shut down the application, you would need to delete the Deployment as well.
