echo "Starting Kubernetes..."
while [ `docker ps | wc -l` -lt 0 ]
do
  sleep 1
done

sleep 2
echo "Kubernetes Started"
