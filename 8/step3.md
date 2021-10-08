To delete Services you can use the `delete service` command. Labels can be used also here:

`kubectl delete service -l app=kubernetes-bootcamp`{{execute}}

Confirm that the service is gone:

`kubectl get services`{{execute}}

This confirms that your Service was removed. To confirm that route is not exposed any more, you can use `curl` to fetch from the previously exposed IP and port:

`curl "http://$(minikube ip):$NODE_PORT"`{{execute}}

This proves that the app is not reachable any more from outside of the cluster.
You can confirm that the app is still running by running `curl` from
inside one of the Pods:

`kubectl exec -ti deployment/kubernetes-bootcamp -- curl http://localhost:8080`{{execute}}

You can see from the output that the application is up, even though you deleted the Service. This is because the Deployment is still managing the application. To shut down the application, you would need to delete the Deployment as well, or scale it to 0 replicas.
