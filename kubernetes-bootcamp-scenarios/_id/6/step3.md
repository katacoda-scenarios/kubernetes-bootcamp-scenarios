Mari lakukan pembaruan berikutnya, dan _deploy image_ yang ditag sebagai `v10`:

`kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10`{{execute}}

Gunakan perintah `get deployments` untuk melihat status dari _deployment_:

`kubectl get deployments`{{execute}}

Dan ternyata ada yang salah... Kita tidak mendapatkan jumlah Pod yang diharapkan.
Daftarkan Pod kembali:

`kubectl get pods`{{execute}}

Perintah `describe` pada Pod dapat memberi informasi tambahan terkait permasalahan ini:

`kubectl describe pods`{{execute}}

Tidak ada _image_ dengan tag `v10` di repositori. Mari kita kembalikan Deployment ke versi sebelumnya yang tidak bermasalah. Untuk itu kita akan menggunakan perintah `rollout undo`:

`kubectl rollout undo deployments/kubernetes-bootcamp`{{execute}}

Perintah `rollout` mengembalikan _deployment_ ke keadaan sebelumnya yang diketahui berjalan dengan baik (_image_ dengan versi v2). Setiap pembaruan memiliki versi tersendiri dan kamu dapat kembali ke versi sebelumnya (yang stabil). Coba daftarkan Pod kembali:

`kubectl get pods`{{execute}}

Saat ini empat Pod sedang berjalan. Periksa kembali versi _image_ yang digunakan pada semua Pod tersebut:

`kubectl describe pods`{{execute}}

Dapat kita lihat _deployment_ keempat Pod tersebut menggunakan versi stabil (v2) dari aplikasi kita. Pembatalan pembaruan telah berhasil dilakukan.
