Verifiquemos que nuestra aplicación se esté ejecutando. Utilizaremos el comando `kubectl get` y buscaremos Pods existentes:

`kubectl get pods`{{execute}}

Si no se están ejecutando pods, significa que el entorno interactivo todavía está recargando su estado anterior. Espere un par de segundos y vuelva a enumerar los Pods. Puede continuar una vez que vea el Pod funcionando.

A continuación, enumeremos los Servicios actuales de nuestro clúster:

`kubectl get services`{{execute}}

Tenemos un Servicio llamado kubernetes que se crea de manera predeterminada cuando minikube inicia el clúster.
Para crear un nuevo servicio y exponerlo al tráfico externo, utilizaremos el comando `expose` con NodePort como parámetro (minikube todavía no admite la opción LoadBalancer).

`kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080`{{execute}}

Vuelva a ejecutar el comando `get services`:

`kubectl get services`{{execute}}

Ahora tenemos un servicio en ejecución llamado kubernetes-bootcamp. Aquí vemos que el Servicio recibió una IP de clúster única, un puerto interno y una IP externa (la IP del Nodo).

Para saber qué puerto se abrió externamente (mediante la opción NodePort) ejecutaremos el comando `describe service`:

`kubectl describe services/kubernetes-bootcamp`{{execute}}

Crea una variable de entorno llamada NODE_PORT que tenga el valor del puerto de nodo asignado:

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

Ahora podemos probar que la aplicación está expuesta fuera del clúster usando `curl`, la IP del nodo y el puerto expuesto externamente:

`curl $(minikube ip):$NODE_PORT`{{execute}}

Y recibimos una respuesta del servidor. El servicio está expuesto.
