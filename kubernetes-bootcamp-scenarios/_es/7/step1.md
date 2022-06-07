Como minikube, kubectl viene instalado en la terminal web. Escribe kubectl en la terminal para ver su uso.
El formato comun de un comando kubectl es: kubectl accion recurso.
Esto ejecuta la accion especificada (como ser crear, describir) sobre el recurso seleccionado (como nodo, contenedor). Tu puedes usar `--help` despues del comando para obtener informacion adicional acerca de posibles parametros (`kubectl get nodes --help`).

Verifica que kubectl esta configurado para comunicarse con tu cluster, ejecutando el siguiente comando: `kubectl version`:

`kubectl version`{{execute}}

OK, kubectl esta instalado y puedes ver las versiones del cliente y servidor.

Para ver los nodos del cluster, ejecuta el comando `kubectl get nodes`.

`kubectl get nodes`{{execute}}

Aqui podemos ver los nodo disponibles (1 en nuestro caso). Kubernetes elegirá donde desplegar nuestra aplicación basado en los nodos disponibles en los recursos.