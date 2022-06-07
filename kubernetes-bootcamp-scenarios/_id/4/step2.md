Mengingatkan kembali bahwa Pod berjalan dalam sebuah jaringan privat yang terisolasi - sehingga kita membutuhkan akses proksi
ke mereka sehingga kita dapat men-_debug_ dan berinteraksi. Untuk ini, kita akan menggunakan perintah `kubectl proxy` untuk menjalankan proksi di jendela terminal kedua. Klik pada perintah di bawah ini untuk membuka terminal baru dan menjalankan `proxy`:

`echo -e "\n\n\n\e[92mMemulai Proxy. Setelah dimulai tidak akan ada respon keluaran. Silahkan klik Tab Terminal pertama\n"; kubectl proxy`{{execute T2}}

Kembali lagi, kita akan mengambil nama Pod dan kueri Pod secara langsung melalui proksi.
Untuk mendapatkan nama Pod dan menyimpannya dalam variabel lingkungan POD_NAME jalankan:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Nama Pod: $POD_NAME`{{execute T1}}

Untuk melihat hasil dari aplikasi kita, jalankan perintah `curl` berikut:

`curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/`{{execute T1}}

URL ini adalah rute ke API dari Pod.
