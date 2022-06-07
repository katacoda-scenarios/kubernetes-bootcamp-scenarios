Untuk menghapus Service, kamu dapat menggunakan perintah `delete service`. Label juga dapat digunakan di sini:

`kubectl delete service -l app=kubernetes-bootcamp`{{execute}}

Pastikan Service sudah terhapus:

`kubectl get services`{{execute}}

Hal ini mengonfirmasikan bahwa Service sudah terhapus. Untuk memastikan rute sebelumnya tidak terekspos lagi, kamu dapat menjalankan `curl` kembali dengan IP dan porta yang terkespos sebelumnya:

`curl $(minikube ip):$NODE_PORT`{{execute}}

Hal ini membuktikan bahwa aplikasi sudah tidak dapat diakses lagi dari luar klaster.
Kamu dapat memastikan bahwa aplikasi tetap berjlan dengan menjalankan `curl` di dalam Pod:

`kubectl exec -ti $POD_NAME -- curl localhost:8080`{{execute}}

Terlihat aplikasi masih berjalan. Hal ini terjadi karena pengelolaan aplikasi dilakukan oleh Deployment. Untuk mematikan aplikasi, kamu juga perlu menghapus Deployment.
