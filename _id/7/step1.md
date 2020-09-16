Seperti minikube, kubectl juga sudah terpasang di terminal daring. Ketik kubectl di dalam terminal untuk melihat penggunaanya.
Format yang umum digunakan dari sebuah perintah kubectl adalah: kubectl aksi sumber daya.
Hal ini akan menjalankan aksi yang ditentukan (seperti membuat, mendeskripsikan) pada sumber daya yang ditetapkan (seperti _node_, kontainer). Kamu juga dapat menggunakan `--help` diakhir perintah untuk mendapatkan informasi tambahan tentang parameter-parameter yang dapat digunakan (misalkan: `kubectl get nodes --help`).

Periksa apakah kubectl telah dikonfigurasikan untuk berkomunikasi dengan klastermu dengan menjalankan perintah `kubectl version`:

`kubectl version`{{execute}}

OK, kubectl telah terpasang dan kamu dapat melihat versi klien dan _server_.

Untuk menampilkan _node_ yang ada di dalam klastermu jalankan perintah `kubectl get nodes`:

`kubectl get nodes`{{execute}}

Di sini kita dapat melihat semua _node_ yang tersedia (ada 1 dalam kasus kita). Kubernetes akan memilih tempat untuk men-_deploy_ aplikasi kita berdasakan sumber daya Node yang tersedia.
