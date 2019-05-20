Ahora, consultarmemos información acerca del clúster ejecutando *kubectl cluster-info*:

`kubectl cluster-info`{{execute}}

Como podemos ver, en estos momentos hay un master en ejecución y un panel de control. El panel de control de Kubernetes le permite ver información sobre los diferentes elementos desplegados en el clúster a través de una interfaz web. De todos modos, durante este tutorial, nos enfocaremos en la línea de comandos para implementar y explorar nuestra aplicación.

Para ver los nodos en el clúster, puedes ejecutar el comando *kubectl get nodes*:

`kubectl get nodes`{{execute}}

Este comando muestra todos los nodos disponibles para ejecutar nuestras aplicaciones. En estos momentos, solo tenemos un nodo y podemos ver que su estado está *ready*, es decir, listo para ejecutar cargas de trabajo.
