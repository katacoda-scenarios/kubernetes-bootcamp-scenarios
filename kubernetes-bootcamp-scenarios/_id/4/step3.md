Semua yang biasa dikirimkan aplikasi ke `STDOUT` menjadi log untuk kontainer dalam Pod. Kita dapat mengambilnya dengan mengunakan perintah `kubectl logs`:

`kubectl logs $POD_NAME`{{execute T1}}

*Catatan: Kita tidak perlu memerinci nama kontainer, karena kita saat ini hanya memiliki satu kontainer dalam _pod_.*
