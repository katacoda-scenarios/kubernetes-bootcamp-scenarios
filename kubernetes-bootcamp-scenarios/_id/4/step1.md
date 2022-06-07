Mari kita periksa apakah aplikasi yang kita _deploy_ di skenario sebelumnya sedang berjalan. Kita akan menggunakan perintah `kubectl get` dan melihat Pod yang ada:

`kubectl get pods`{{execute}}

Jika tidak ada pod yang berjalan maka itu artinya lingkungan interaktif masih memuat ulang keadaan sebelumnya. Harap tunggu beberapa detik dan mendaftar Pod lagi. Kamu bisa melanjutkan setelah melihat satu Pod berjalan.

Selanjutnya, untuk melihat kontainer apa yada ada dalam Pod dan _image_ apa yang digunakan untuk membangun kontainer tersebut kita jalankan perintah `describe pods`: 

`kubectl describe pods`{{execute}}

Kita dapat lihat di sini detail tentang kontainer dari Pod: alamat IP, porta yang digunakan dan daftar _event_ terkait siklus hidup dari Pod tersebut.

Hasil dari perintah `describe` ini panjang dan mencakup beberapa konsep yang masih belum dijelaskan, tapi jangan khawatir, kesemuanya akan semakin bisa dipahami pada akhir _bootcamp_ ini.

*Catatan: perintah `describe` dapat digunakan untuk mendapatkan informasi kebanyakan primitif Kubernetes: _node_, _pod_, _deployment_. Hasil `describe` dirancang untuk dapat dibaca manusia, bukan ditujukan untuk _scripting_*
