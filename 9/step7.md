## Deploying your changes

You now need rebuild and redeploy the applications for your changes to take effect. Rebuild the application using the following commands, making sure you're in the `start` directory:

`mvn package -pl system`{{execute}}

`mvn package -pl inventory`{{execute}}

Now you need to delete your old Kubernetes deployment then deploy your updated deployment by issuing the following commands:

`kubectl replace --force -f kubernetes.yaml`{{execute}}

You should see the following output from the commands:

`
$ kubectl replace --force -f kubernetes.yaml
deployment.apps "system-deployment" deleted
deployment.apps "inventory-deployment" deleted
service "system-service" deleted
service "inventory-service" deleted
deployment.apps/system-deployment replaced
deployment.apps/inventory-deployment replaced
service/system-service replaced
service/inventory-service replaced
`

Check the status of the pods for the services with:

`kubectl get --watch pods`{{execute}}

You should eventually see the status of **Ready** for the two services. Press `Ctrl-C` to exit the terminal command. 

Call the updated system service and check the headers using the curl command:


`curl -# -I -u bob:bobpwd -D - http://$( minikube ip ):31000/system/properties | grep -i ^X-App-Name:`{{execute}}

You should see that the response `X-App-Name` header has changed from `system` to `my-system`​.

Verify that inventory service is now using the Kubernetes Secret for the credentials by making the following curl request:

`curl http://$( minikube ip ):32000/inventory/systems/system-service`{{execute}}

If the request fails, check you've configured the Secret correctly.
