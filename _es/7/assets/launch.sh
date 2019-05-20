echo "Iniciando Kubernetes..."
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

echo "Kubernetes iniciado"
