## Creating a ConfigMap and Secret

There are several ways to configure an environment variable in containers. You are going to use a Kubernetes ConfigMap and Kubernetes secret to set these values. These are resources provided by Kubernetes that are used as a way to provide configuration values to your containers. A benefit is that they can be re-used across multiple containers, including being assigned to different environment variables for the different containers.

Create a ConfigMap to configure the application name with the following kubectl command:

`kubectl create configmap sys-app-name --from-literal name=my-system`{{execute}}

This command deploys a ConfigMap named `sys-app-name` to your cluster. It has a key called `name` with a value of `my-system`. The `--from-literal` flag allows you to specify individual key-value pairs to store in this ConfigMap. Other available options, such as `--from-file` and `--from-env-file`, provide more versatility as to how to configure. Details about these options can be found in the Kubernetes CLI documentation here https://kubernetes.io/docs/concepts/configuration/configmap/.

Create a secret to configure the credentials that the inventory service will use to authenticate against system service with the following kubectl command:

`kubectl create secret generic sys-app-credentials --from-literal username=bob --from-literal password=bobpwd`{{execute}}

This command looks very similar to the command to create a ConfigMap, one difference is the word generic. It means that you’re creating a secret that is `generic`, which means it is not a specialized type of secret. There are different types of secrets, such as secrets to store Docker credentials and secrets to store public/private key pairs.

A secret is similar to a ConfigMap, except a secret is used for sensitive information such as credentials. One of the main differences is that you have to explicitly tell kubectl to show you the contents of a secret. Additionally, when it does show you the information, it only shows you a Base64 encoded version so that a casual onlooker can't accidentally see any sensitive data. secrets don’t provide any encryption by default, that is something you’ll either need to do yourself or find an alternate option to configure.
