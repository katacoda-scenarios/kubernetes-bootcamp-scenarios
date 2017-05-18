To get logs from the container, we’ll use the `kubectl logs` command:

`kubectl logs $POD_NAME`{{execute T2}}

*Note: We don’t need to specify the container name, because we only have one container inside the pod.*