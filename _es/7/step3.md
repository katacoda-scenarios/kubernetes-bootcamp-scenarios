Los Pods que están ejecutándose dentro de Kubernetes están en un repositorio privado, con una red aislada. Por defecto solo son visibles desde otros pods y servicios del mismo cluster de kubernetes, pero no fuera de la red.
Cuando usamos `kubectl`, estamos interactuando a través de un endpoint de la API para comunicarse con nuestra aplicación.

Cubriremos otras opciones de como exponer tu aplicación fuera del cluster de kubernetes en el módulo 4.

El comando `kubectl` puede crear un proxy que reenviará las comunicaciones de la red privada a todo el cluster. El proxy puede ser cancelado presionando Control-C  y no mostrará ninguna salida mientras se esté ejcutando.

Abriremos una segunda ventana de la terminal para correr el proxy.
`kubectl proxy`{{execute T2}}

*Note: Verifica la parte superior de la terminal. El proxy se ejecutó en una nueva pestaña (Terminal 2), y los comandos mas recientes fueron ejecutados en la pestaña original (Terminal 1). El proxy aún se ejecuta en la segunda terminal, y esto permitió que nuestro comando curl funcione, usando `localhost:8001`.*

Ahora tenemos una conexión entre nuestro host (la terminal online) y el cluster de kubernetes. El proxy habilita el acceso a la API desde esas terminales.

Podemos ver todas las APIs alojadas a través del endpoint proxy. Por ejemplo, podemos consultar la version directamente desde la API usando el comando `curl`:

`curl http://localhost:8001/version`{{execute T1}}

La API creará automáticamente un endpoint por cada pod, basado en el pod name, que es también accesible a través del proxy.

Primero necesitamos obtener el nombre del pod, y lo almacenaremos en la variable POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute T1}}

*Note: Verifica la parte superior de la terminal. El proxy se ejecutó en una nueva pestaña (Terminal 2), y los comandos mas recientes fueron ejecutados en la pestaña original (Terminal 1). El proxy aún se ejecuta en la segunda terminal, y esto permitió que nuestro comando curl funcione, usando `localhost:8001`.*

Para que el nuevo despliegue sea accesible sin usar el Proxy, se requiere un Servicio que se explicará en los siguientes módulos.
