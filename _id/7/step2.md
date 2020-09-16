Mari _deploy_ aplikasi Kubernetes pertama kita dengan perintah `kubectl create deployment`. Kita perlu memberikan nama _deployment_ dan lokasi _image_ dari aplikasi (masukkan URL repositori yang lengkap untuk _image_ yang ada di luar Docker hub).

`kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1`{{execute}}

Hebat! Kamu sudah berhasil men-_deploy_ aplikasi pertamamu dengan membuat sebuah _deployment_. Hal ini menjalankan beberapa hal untukmu:

- mencari _node_ yang cocok di mana instans dari aplikasi kita dapat dijalankan (kita hanya mempunyai 1 _node_ yang tersedia)
- menjadwalkan aplikasi kita untuk berjalan di Node tersebut
- mengonfigurasikan klaster untuk menjadwalkan ulang instans dari aplikasi di Node yang baru ketika dibutuhkan

Untuk mendaftar _deployment_ yang sudah ada, kamu dapat menjalankan perintah `get deployments`:

`kubectl get deployments`{{execute}}

Kita dapat melihat di sana ada 1 _deployment_ berjalan dengan satu instans dari aplikasimu. Instans tersebut berjalan di dalam kontainer Docker pada _node_ yang tersedia.
