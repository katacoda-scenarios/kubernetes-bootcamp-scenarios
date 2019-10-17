Recuerde que los Pods se ejecutan en una red privada y aislada, por lo que necesitamos tener acceso proxy a ellos para poder depurar e interactuar con ellos. Para hacer esto, usaremos el comando `kubectl proxy` para ejecutar un proxy en una segunda ventana de terminal. Haga clic en el comando a continuación para abrir automáticamente un nuevo terminal y ejecutar el `proxy`:

`echo -e "\n\n\n\e[92mIniciando Proxy. Después de comenzar, no generará una respuesta. Haga clic en la primera pestaña Terminal\n"; kubectl proxy`{{execute T2}}

Ahora nuevamente, obtendremos el nombre del pod y consultaremos ese pod directamente a través del proxy.
Para obtener el nombre del Pod y almacenarlo en la variable de entorno POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T1}}

Para ver la salida de nuestra aplicación, ejecuta una solicitud `curl`.

`curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/`{{execute T1}}

The url is the route to the API of the Pod.

La url es la ruta a la API del Pod.
