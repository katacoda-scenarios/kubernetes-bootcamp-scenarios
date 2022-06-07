Mari melihat detail klaster. Kita akan melakukannya dengan menjalankan perintah `kubectl cluster-info`:

`kubectl cluster-info`{{execute}}

Selama tutorial ini, kita akan fokus pada baris perintah untuk men-_deploy_ dan mengeksplorasi aplikasi kita.
Untuk melihat Node pada klaster, jalankan perintah `kubectl get nodes`:

`kubectl get nodes`{{execute}}

Perintah ini memperlihatkan semua Node yang dapat digunakan untuk hos aplikasi kita. Sekarang kita hanya mempunyai 1 Node, dan kita dapat melihat bahwa statusnya telah siap (_ready_). Artinya, Node telah siap untuk menerima perintah untuk menjalankan aplikasi melalui _deployment_.
