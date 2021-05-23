Deployment membuat label secara otomatis untuk Pod kita. Kamu dapat melihat nama dari label tersebut dengan perintah `describe deployment`:

`kubectl describe deployment`{{execute}}

Gunakan label tersebut untuk mendaftar Pod yang ada. Jalankan perintah `kubectl get pods` dengan parameter `-l` diikuti dengan nama label:

`kubectl get pods -l app=kubernetes-bootcamp`{{execute}}

Kamu dapat melakukan hal yang sama untuk mendaftar Service yang sudah ada:

`kubectl get services -l app=kubernetes-bootcamp`{{execute}}

Dapatkan nama Pod dan simpan nilainya ke dalam variable lingkungan dengan nama POD_NAME:

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME`{{execute}}

Untuk memasang label baru, kita dapat menggunakan perintah label diikuti dengan tipe objek, nama objek dan label baru tersebut:

`kubectl label pods $POD_NAME version=v1`{{execute}}

Perintah di atas akan memberikan label baru untuk Pod kita (menyematkan versi aplikasi kita pada Pod), dan kita dapat memastikan hal ini dengan perintah describe pod:

`kubectl describe pods $POD_NAME`{{execute}}

Dapat dilihat label baru sudah tercantum dalam deskripsi Pod kita. Dan sekarang kita dapat mendaftar Pod dengan menggunakan label tadi:

`kubectl get pods -l version=v1`{{execute}}

Dan kita dapat melihat Pod tersebut.
