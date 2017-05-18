To list your deployments use the `get deployments` command:
`kubectl get deployments`{{execute}}

We should have 1 Pod. If not, run the command again. This shows:

The DESIRED state is showing the configured number of replicas

The CURRENT state show how many replicas are running now

The UP-TO-DATE is the number of replicas that were updated to match the desired (configured) state

The AVAILABLE state shows how many replicas are actually AVAILABLE to the users

Next, let’s scale the Deployment to 4 replicas. We’ll use the `kubectl scale` command, followed by the deployment type, name and desired number of instances:

`kubectl scale deployments/kubernetes-bootcamp --replicas=4`{{execute}}

To list your Deployments once again, use `get deployments`:

`kubectl get deployments`{{execute}}

The change was applied, and we have 4 instances of the application available. Next, let’s check if the number of Pods changed:

`kubectl get pods -o wide`{{execute}}

There are 4 Pods now, with different IP addresses. The change was registered in the Deployment events log. To check that, use the describe command:

`kubectl describe deployments/kubernetes-bootcamp`{{execute}}

You can also view in the output of this command that there are 4 replicas now.
