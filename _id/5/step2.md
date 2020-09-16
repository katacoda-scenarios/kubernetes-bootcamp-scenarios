Mari periksa apakah saat ini Service sudah menyeimbangkan beban trafik. Untuk mengetahui IP dan porta yang terekspos, kita dapat menggunakan perintah `describe service` yang telah dipelajari di Modul sebelumnya:

`kubectl describe services/kubernetes-bootcamp`{{execute}}

Buat satu variabel lingkungan dengan nama NODE_PORT yang menyimpan nilai dari porta Node:

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

Selanjutnya, kita akan melakukan `curl` ke IP dan porta yang terekspos. Jalankan perintah berikut beberapa kali:

`curl $(minikube ip):$NODE_PORT`{{execute}}

Dapat diperhatikan, kita mengenai Pod yang berbeda pada setiap permintaan. Hal ini menunjukkan penyeimbangan beban sudah bekerja.
