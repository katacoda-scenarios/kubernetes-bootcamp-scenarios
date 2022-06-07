Para eliminar Servicios, puede usar el comando `delete service`. Las etiquetas se pueden usar también aquí:

`kubectl delete service -l app=kubernetes-bootcamp`{{execute}}

Confirme que el servicio se elimino:

`kubectl get services`{{execute}}

Esto confirma que nuestro Servicio fue eliminado. Para confirmar que la ruta ya no está expuesta, puede ejecutar `curl` con la IP y el puerto expuestos anteriormente:

`curl $(minikube ip):$NODE_PORT`{{execute}}

Esto demuestra que la aplicación ya no es accesible desde fuera del clúster.
Puede confirmar que la aplicación todavía se está ejecutando, usando `curl` dentro del pod:

`kubectl exec -ti $POD_NAME -- curl localhost:8080`{{execute}}

Vemos aquí que la aplicación está activa. Esto se debe a que la implementación está administrando la aplicación. Para cerrar la aplicación, también deberá eliminar la implementación.
