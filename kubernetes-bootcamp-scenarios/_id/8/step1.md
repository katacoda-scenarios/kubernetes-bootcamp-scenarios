Mari periksa apakah aplikasi yang kita _deploy_ di skenario sebelumnya sedang berjalan. Kita akan menggunakan perintah `kubectl get` dan melihat Pod yang ada:

`kubectl get pods`{{execute}}

Jika tidak ada Pod yang berjalan maka artinya lingkungan interaktif masih memuat ulang keadaan sebelumnya. Harap tunggu beberapa detik dan mendaftar Pod lagi. Kamu bisa lanjut setelah melihat satu Pod berjalan.

Selanjutnya, daftarkan Service yang ada di dalam klaster:

`kubectl get services`{{execute}}

Kita memiliki sebuah Service bernama kubernetes yang dibuat langsung ketika minikube menjalankan klaster.
Untuk membuat Service baru dan mengeksposnya secara publik, kita akan menggunakan perintah `expose` dengan NodePort sebagai parameter (minikube saat ini belum mendukung opsi LoadBalancer).

`kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080`{{execute}}

Jalankan kembali perintah `get services`:

`kubectl get services`{{execute}}

Sekarang kita memiliki sebuah Service yang berjalan dengan nama kubernetes-bootcamp. Di sini kita dapat melihat Service mendapatkan IP klaster yang unik, porta internal dan sebuah IP eksternal (IP dari Node).

Untuk mengetahui porta mana yang dibuka ke luar (dengan opsi NodePort), kita akan menjalankan perintah `describe service`:

`kubectl describe services/kubernetes-bootcamp`{{execute}}

Buat satu variabel lingkungan dengan nama NODE_PORT yang menyimpan nilai dari porta Node:

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

Sekarang kita dapat memeriksa apakah aplikasi kita sudah terkspos ke luar klaster dengan menggunakan `curl`, IP dari Node dan porta yang terkespos ke luar:

`curl $(minikube ip):$NODE_PORT`{{execute}}

Dalam hal ini kita mendapatkan response dari _server_. Service telah berhasil diekspos.
