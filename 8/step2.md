The Deployment created automatically a label for its Pod.
By running `kubectl describe`, you can see the name of the label:

`kubectl describe deployment`{{execute}}

You can use this label to query the list of Pods that belong
to the `kubernetes-bootcamp` Deployment. Run the `kubectl get pods`
command, and specify a selector to match that label:

`kubectl get pods --selector app=kubernetes-bootcamp`{{execute}}

You can do the same to list the existing Services:

`kubectl get services --selector app=kubernetes-bootcamp`{{execute}}

There is only one matching Pod running.
Get the name of the Pod and store it in the `POD_NAME` environment variable:

`export POD_NAME="$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')"
echo Name of the Pod: $POD_NAME`{{execute}}

To set an extra label, you can use the `kubectl label` command followed by
the object type, object name and the new label:

`kubectl label pods $POD_NAME version=v1`{{execute}}

This will apply a new label to that specific Pod (you pinned the application version to the Pod). You can check it by running `kubectl describe`:

`kubectl describe pods $POD_NAME`{{execute}}

You can see that the one running Pod has the extra label you
set.
Now you can also find version v1 Pods for this app:

`kubectl get pods --selector app=kubernetes-bootcamp,version=v1`{{execute}}

And you see the Pod.

If you run:
`kubectl scale deployment/kubernetes-bootcamp --replicas=2`{{execute}}

and then:
`kubectl get services --selector app=kubernetes-bootcamp`{{execute}}

you see that there are now two Pods backing the Service. However,
because you only set the `version` label for one of those two Pods,
selecting on `version` still only shows one match:

`kubectl get pods --selector app=kubernetes-bootcamp,version=v1`{{execute}}
