Untuk mendaftar _deployment_ yang ada, gunakan perintah `get deployments`:

`kubectl get deployments`{{execute}}

Keluaran dari perintah di atas akan seperti contoh di bawah ini:
```
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
kubernetes-bootcamp   1/1     1            1           11m
```

Kita seharusnya sudah memiliki 1 Pod. Jika tidak, jalankan kembali perintah sebelumnya. Keluaran dari perintah ini menunjukkan:
- *NAME* daftar nama Deployment yang ada di dalam klaster
- *READY* menunjukkan rasio replika SEKARANG/DIHARAPKAN
- *UP-TO-DATE* menunjukkan jumlah replika yang telah diperbarui untuk mencapai keadaan yang diinginkan
- *AVAILABLE* menunjukkan jumlah replika dari aplikasi yang tersedia untuk pengguna
- *AGE* menampilkan durasi berjalannya aplikasi

Untuk melihat ReplicaSet yang dibuat dari Deployment, jalankan:

`kubectl get rs`{{execute}}

Perhatikan nama ReplicaSet selalu memiliki format `[NAMA-DEPLOYMENT]-[STRING-ACAK]`. String acak dibuat secara acak dengan menggunakan pod-template-hash sebagai benih.

Dua kolom penting dari keluaran perintah ini adalah:
- *DESIRED* menampilkan jumlah replika yang diharapkan dari aplikasi yang kamu definisikan ketika membuat Deployment
- *CURRENT* menunjukkan jumlah replika yang sedang berjalan

Selanjutnya, mari lakukan penyekalaan Deployment menjadi 4 replika. Kita akan menggunakan perintah `kubectl scale`, diikuti dengan tipe _deployment_, nama dan jumlah instans yang diinginkan:

`kubectl scale deployments/kubernetes-bootcamp --replicas=4`{{execute}}

Untuk mendaftar Deployment kembali, gunakan perintah `get deployments`:

`kubectl get deployments`{{execute}}

Perubahan sebelumnya telah diterapkan, saat ini sudah tersedia 4 instans aplikasi. Selanjutnya, periksa juga apakah jumlah Pod telah berubah:

`kubectl get pods -o wide`{{execute}}

Saat ini sudah ada 4 Pod dengan alamat IP yang berbeda. Perubahan ini sudah tercatat di dalam log. Untuk memastikan perubahan tersebut, kamu juga dapat menggunakan perintah `describe`:

`kubectl describe deployments/kubernetes-bootcamp`{{execute}}

Dari keluaran perintah di atas, kamu dapat melihat ada 4 replika saat ini.
