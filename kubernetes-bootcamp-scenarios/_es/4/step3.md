Todo lo que la aplicación normalmente enviaría a `STDOUT` se convierte en logs para el contenedor dentro del Pod. Podemos recuperar estos logs usando el comando `kubectl logs`:

`kubectl logs $POD_NAME`{{execute T1}}

*Nota: No necesitamos especificar el nombre del contenedor, porque solo tenemos un contenedor dentro del pod.*
