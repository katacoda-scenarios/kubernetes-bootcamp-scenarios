## Build and Deploy the Java microservices

To begin, make sure your Kubernetes environment is set up. Once the terminal has finished outputting messages and is ready for input it should be setup. To confirm it is ready please run the following command:

`kubectl version`{{execute}}

You should now see the versions of your kubectl client and server. If so, your environment is all set up. If you do not see the version of your Kubernetes server wait a few moments and repeat the previous command until it is shown.

Now you need to navigate into the project directory that has been provided for you.  This contains the implementation of the MicroProfile microservices, configuration for the MicroProfile runtime, and Kubernetes configuration.

`cd sample-kubernetes-config/start/`{{execute}}

You will notice there is a 'finish' directory. This contains the finished code for this tutorial for reference.

The two microservices you will deploy are called 'system' and 'inventory'. The system microservice returns JVM properties of the container it is running in. The inventory microservice adds the properties from the system microservice into the inventory. This demonstrates how communication can be achieved between two microservices in separate pods inside a Kubernetes cluster. To build the applications with Maven, run the following commands one after the other:

`mvn package -pl system`{{execute}}


`mvn package -pl inventory`{{execute}}

Once the services have been built, you need to deploy them to Kubernetes. To learn more about Kubernetes manifests, check out the following documentation: https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/

To do this use, the following command:

`kubectl apply -f kubernetes.yaml`{{execute}}
