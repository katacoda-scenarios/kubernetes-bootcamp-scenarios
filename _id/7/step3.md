Pod yang berjalan di dalam Kubernetes berjalan di atas jaringan privat dan terisolasi.
Secara bawaan, suatu Pod dapat dilihat dari Pod dan Service lain dalam satu klaster Kubernetes yang sama, tetapi tidak dari luar jaringan tersebut.
Ketika menggunakan `kubectl`, kita berinteraksi melalui _endpoint_ API untuk berkomunikasi dengan aplikasi kita.

Kita akan membahas opsi-opsi lain untuk mengekspos aplikasimu ke luar klaster Kubernetes di dalam Modul 4.

Perintah `kubectl` dapat membuat proksi yang akan meneruskan komunikasi ke jaringan privat di dalam kluster. Proksi dapat diakhiri dengan menekan control-C dan tidak akan menampilkan keluaran apapun saat dijalankan.

Kita akan membuka jendela terminal kedua untuk menjalankan proksi.

```
echo -e "\n\n\n\e[92mMemulai Proxy. Setelah dimulai tidak akan ada respon keluaran. Silahkan klik Tab Terminal pertama\n"; 
kubectl proxy
```{{execute T2}}

Sekarang kita telah memiliki koneksi antara hos kita (terminal daring) dan klaster Kubernetes. Proksi tersebut memungkingkan akses langsung ke API klaster Kubernetes dari terminal yang kita jalankan.

Kamu dapat melihat semua API yang tersedia melalui _endpoint_ proksi. Sebagai contoh, kita dapat mengetahui versi klien dan _server_ kluster secara langsung melalui API dengan perintah `curl`:

`curl http://localhost:8001/version`{{execute T1}}

**Jika port 8001 tidak tersedia, pastikan perintah `kubectl proxy` di atas berjalan.**

_Server_ API secara otomatis akan membuat satu _endpoint_ untuk setiap Pod berdasarkan nama Pod tersebut yang juga bisa diakses melalui proksi.

Pertama-tama kita perlu mendapatkan nama Pod dan menyimpan informasi ini ke dalam variabel lingkungan dengan nama POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Nama Pod: $POD_NAME`{{execute T1}}

*Catatan: Periksa bagian atas dari terminal. Proksi berjalan di dalam tab baru (Terminal 2), dan perintah-perintah terakhir dijalankan di tab pertama (Terminal 1). Proksi tersebut masih terus berjalan di tab kedua, hal ini memungkinkan kita untuk menjalankan perintah curl menggunakan `localhost:8001`.*

Agar _deployment_ baru bisa diakses tanpa menggunakan Proxy, dibutuhkan sebuah Service yang akan dijelaskan di dalam modul yang lain.
