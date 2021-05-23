La implementación creó automáticamente una etiqueta para nuestro Pod. Con el comando `describe` puede ver el nombre de la etiqueta:

`kubectl describe deployment`{{execute}}

Usemos esta etiqueta para consultar nuestra lista de Pods. Utilizaremos el comando `kubectl get pods` con -l como parámetro, seguido de los valores de la etiqueta:

`kubectl get pods -l app=kubernetes-bootcamp`{{execute}}

Puede hacer lo mismo para listar los servicios existentes:

`kubectl get services -l app=kubernetes-bootcamp`{{execute}}

Obtenga el nombre del Pod y guárdelo en la variable de entorno POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute}}

Para aplicar una nueva etiqueta, utilizamos el comando de etiqueta seguido del tipo de objeto, el nombre del objeto y la nueva etiqueta:

`kubectl label pods $POD_NAME version=v1`{{execute}}

Esto aplicará una nueva etiqueta a nuestro Pod (fijamos la versión de la aplicación al Pod), y podemos verificarlo con el comando `describe pod`:

`kubectl describe pods $POD_NAME`{{execute}}

Vemos aquí que la etiqueta ahora está adherida a nuestro Pod. Y ahora podemos consultar la lista de pods usando la nueva etiqueta:

`kubectl get pods -l version=v1`{{execute}}

Y vemos el Pod.
