Pertama-tama periksa jika aplikasi sedang berjalan. Untuk mengetahui IP dan porta yang terekspos kita dapat menggunakan perintah `describe service`:

`kubectl describe services/kubernetes-bootcamp`{{execute}}

Buat variabel lingkungan dengan nama NODE_PORT yang menyimpan nilai dari porta Node:

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

Selanjutnya, kita akan melakukan `curl` ke IP dan porta yang terekspos, jalankan perintah berikut beberapa kali:

`curl $(minikube ip):$NODE_PORT`{{execute}}

Dapat diperhatikan kita mengenai Pod yang berbeda pada setiap permintaan dan jika dilihat semua Pod yang berjalan telah diperbarui ke versi yang terakhir (v2).

Pembaruan ini juga dapat dikonfirmasi dengan menjalakan perintah `rollout status`:

`kubectl rollout status deployments/kubernetes-bootcamp`{{execute}}

Untuk melihat versi _image_ dari aplikasi saat ini, jalankan perintah `describe` terhadap Pod:

`kubectl describe pods`{{execute}}

Saat ini kita menjalankan versi 2 dari aplikasi (perhatikan _field_ Image)
