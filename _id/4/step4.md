Kita dapat menjalankan perintah secara langsung di dalam kontainer setelah Pod siap dan berjalan.
Untuk ini, kita dapat menggunakan perintah `exec` diikuti dengan nama Pod sebagai parameter. Mari kita daftar variabel lingkungan yang ada di kontainer:

`kubectl exec $POD_NAME -- env`{{execute T1}}

Lagi-lagi, layak diingatkan lagi bahwa nama kontainer dapat dihilangkan karena kita hanya punya satu kontainer dalam Pod.

Selanjutkan mari kita mulai sesi bash di kontainer:

`kubectl exec -ti $POD_NAME -- bash`{{execute T1}}

Kita sekarang telah membuka konsol dalam kontainer di mana kita menjalankan aplikasi NodeJS kita. Kode sumber dari aplikasi ini ada di dalam berkas server.js:

`cat server.js`{{execute T1}}

Kamu dapat memastikan bahwa aplikasi sudah siap dengan menjalankan perintah `curl`:

`curl localhost:8080`{{execute T1}}

*Catatan: di sini kita menggunakan localhost karena kita mengeksekusi perintah dalam Pod NodeJS. Jika kamu tidak bisa mengakses localhost:8080, pastikan kamu sudah menjalankan perintah `kubectl exec` dan kemudian menjalankan perintah `curl` dari dalam Pod*

Untuk mengakhiri koneksi kontainermu ketik `exit`{{execute T1}}.
