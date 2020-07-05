Mari melihat detail klaster. Kita akan melakukannya dengan menjalankan *kubectl cluster-info*:

`kubectl cluster-info`{{execute}}

Selama tutorial ini, kita akan berfokus kepada baris perintah untuk men-_deploy_ dan eksplorasi aplikasi kita.
Untuk melihat Node pada klaster, jalankan perintah *kubectl get nodes*:

`kubectl get nodes`{{execute}}

Perintah ini memperlihatkan semua Node yang dapat digunakan untuk hos aplikasi kita. Sekarang kita hanya mempunyai 1 Node, dan kita akan melihat bahwa statusnya siap (_ready_) (siap untuk menerima aplikasi sebagai _deployment_).
