Verifiquemos que la aplicación que desplegamos in el escenario previo se está ejecutando. Usaremos el comando `kubectl get` y buscaremos los pods existentes:

`kubectl get pods`{{execute}}

Si no hay pods ejecutándose, significa que el entorno interactivo está todavia recargando su estado previo. Por favor espera un par de segundos y lista los pods nuevamente. Puedes continuar cuando veas que los pods estan corriendo.

Luego, para ver que contenedores están dentro del pod y que imágenes están siendo usadas para construir esos contenedores, ejecutamos el comando `describe pods`:

`kubectl describe pods`{{execute}}

Vemos aquí detalles sobre el contenedor del Pod: dirección IP, los puertos utilizados y una lista de eventos relacionados con el ciclo de vida del Pod.

El resultado del comando `describe` es extenso y cubre algunos conceptos que aún no explicamos, pero no se preocupe, se familiarizarán al final de este bootcamp.

*Nota: el comando `describe` se puede utilizar para obtener información detallada sobre la mayoría de los objetos primitivos de kubernetes: `node`, `pods`, `deployments`. La salida del comando está diseñada para ser legible por humanos, no para ser usada en scripts.*
