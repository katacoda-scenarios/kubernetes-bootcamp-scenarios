Podemos ejecutar comandos directamente en el contenedor una vez que el Pod esté en funcionamiento.
Para esto, usamos el comando `exec` y usamos el nombre del Pod como parámetro. Hagamos una lista de las variables de entorno:

`kubectl exec $POD_NAME -- env`{{execute T1}}

Una vez más, vale la pena mencionar que el nombre del contenedor en sí puede omitirse ya que solo tenemos un contenedor en el Pod.

A continuación, comencemos una sesión bash en el contenedor del Pod:

`kubectl exec -ti $POD_NAME -- bash`{{execute T1}}

Ahora tenemos una consola abierta en el contenedor donde ejecutamos nuestra aplicación NodeJS. El código fuente de la aplicación está en el archivo server.js:

`cat server.js`{{execute T1}}

Puede verificar que la aplicación esté activa ejecutando un comando curl:

`curl localhost:8080`{{execute T1}}

*Nota: aquí usamos localhost porque ejecutamos el comando dentro del Pod NodeJS. Si no puede conectarse a localhost:8080, asegúrese de haber ejecutado el comando kubectl exec y que esté iniciando el comando desde el Pod*

Para cerrar su conexión de contenedor, escriba `exit`{{execute T1}}.
