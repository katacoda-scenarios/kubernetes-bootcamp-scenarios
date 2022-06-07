Untuk mengurangi skala Deployment ke 2 replika, jalankan kembali perintah `scale`:

`kubectl scale deployments/kubernetes-bootcamp --replicas=2`{{execute}}

Daftar Deployment dengan perintah `get deployments` untuk memeriksa apakah perubahan yang dilakukan di atas sudah diterapkan:

`kubectl get deployments`{{execute}}

Dapat dilihat jumlah replika sudah berkurang menjadi 2. Coba juga daftar jumlah Pod dengan perintah `get pods`:
 
`kubectl get pods -o wide`{{execute}}

Hal ini mengkonfirmasi bahwa 2 Pod sudah dimatikan.
