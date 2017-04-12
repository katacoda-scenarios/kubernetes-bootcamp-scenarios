To interact with Kubernetes during this bootcamp we’ll use the command line interface, kubectl. We’ll explain kubectl in detail in the next modules, but for now, we’re just going to look at some cluster information.
To check if kubectl is installed you can run the *kubectl version* command:

`kubectl version`{{execute}}

OK, kubectl is configured and we can see both the client and the server Kubernetes version: 1.5. The client version is the kubectl version; the server version is the Kubernetes version installed on the master. Here, you can also see details about the build.
