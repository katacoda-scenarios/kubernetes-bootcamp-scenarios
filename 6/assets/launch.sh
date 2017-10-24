echo "Starting Kubernetes..."
while [ ! -f /opt/katacoda-completed ]
do
  sleep 1
done

sleep 2
echo "Kubernetes Started"
