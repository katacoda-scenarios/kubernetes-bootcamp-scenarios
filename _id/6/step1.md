Untuk mendaftar _deployment_ yang ada, gunakan perintah `get deployments`:

`kubectl get deployments`{{execute}}

Untuk mendaftar Pod yang sedang berjalan, gunakan perintah `get pods`:

`kubectl get pods`{{execute}}

Untuk menampilkan versi _image_ dari aplikasi saat ini, jalankan perintah `describe` terhadap Pod (lihat pada _field_ Image):

`kubectl describe pods`{{execute}}

Untuk memperbarui _image_ aplikasi ke versi 2, gunakan perintah `set image`, diikuti dengan nama _deployment_ dan versi _image_ yang baru:

`kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2`{{execute}}

Perintah tersebut memberitahukan Deployment untuk menggunakan _image_ yang berbeda untuk aplikasi kita dan menginisiasi pembaruan. Periksa status dari Pod baru dan lihat Pod lama yang berhenti dengan perintah `get pods`:

`kubectl get pods`{{execute}}
