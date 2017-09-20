Anything that the application would normally send to `STDOUT` becomes logs for the container within the Pod. We can retrieve these logs using the `kubectl logs` command:

`kubectl logs $POD_NAME`{{execute T1}}

*Note: We don’t need to specify the container name, because we only have one container inside the pod.*
