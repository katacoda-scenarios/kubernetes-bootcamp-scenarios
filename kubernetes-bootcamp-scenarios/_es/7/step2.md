Ejecutemos nuestra primera aplicación en Kubernetes con el comando `kubectl run`. El comando `run` crea un nuevo despliegue. Necesitamos proveer el nombre del despliegue y la ubicación de la imagen. (incluyendo la ruta completa para las imagenes alojadas fuera de Docker hub).

`kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1`{{execute}}

¡Genial! Acabas de desplegar tu primera aplicación crando un despliegue. Esto ejecuto varias cosas por ti:
- Buscó un nodo apropiado donde la instancia de la aplicación pueda ser desplegada (nosotros tenemos solamente 1 nodo disponible).
- Agendo la ejecución de la aplicación en ese nodo.
- Configuró el cluster para recalenzarizar una instancia en un nuevo nodo cuando sea necesario.

Para listar los despliegues, use el comando `get deployments`:
`kubectl get deployments`{{execute}}

Podemos ver que hay 1 despliegue ejecutando una sola instancia de la aplicación. La instancia se está ejecutando dentro de un container Docker en tu nodo.
