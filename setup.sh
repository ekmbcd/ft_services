echo
echo "███████╗████████╗     ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗███████╗"
echo "██╔════╝╚══██╔══╝     ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝██╔════╝"
echo "█████╗     ██║        ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  ███████╗"
echo "██╔══╝     ██║        ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  ╚════██║"
echo "██║        ██║███████╗███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗███████║"
echo "╚═╝        ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝╚══════╝"
                                                                                  
pkill -9 -f "kubectl proxy"
kube_IP=`kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p`
sed -i '' "s/KUBE_IP/$kube_IP/g" ./srcs/yamls/*
# --no-cache
docker build -t influxdb srcs/influxdb/
docker build -t nginx_alpine srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t wordpress srcs/wordpress/
docker build -t phpmyadmin-image srcs/phpmyadmin/
docker build -t ftps-image srcs/ftps/
docker build -t grafana srcs/grafana/
docker build -t telegraf srcs/telegraf/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

kubectl apply -f srcs/yamls/metallb.yaml
kubectl apply -f srcs/yamls/influxdb.yaml
kubectl apply -f srcs/yamls/mysql.yaml
kubectl apply -f srcs/yamls/wordpress.yaml
kubectl apply -f srcs/yamls/phpmyadmin.yaml
kubectl apply -f srcs/yamls/nginx.yaml
kubectl apply -f srcs/yamls/ftps.yaml
kubectl apply -f srcs/yamls/user.yaml
kubectl apply -f srcs/yamls/telegraf.yaml
kubectl apply -f srcs/yamls/grafana.yaml



kubectl proxy & 
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" | pbcopy
open http://localhost &
# kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppassword
run=`kubectl get pods | grep mysql | grep Running`
echo "Waiting for MySQL"
while [[ $run == '' ]]
do
	run=`kubectl get pods | grep mysql | grep Running`
	printf "."
	sleep 4
done

mysql_pod=`kubectl get pods | grep mysql | tr ' ' '\n' | head -n 1`
kubectl exec $mysql_pod -- sh init_wordpress.sh
sed -i '' "s/$kube_IP/KUBE_IP/g" ./srcs/yamls/*
# kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep ${SA_NAME} | awk '{print $1}')
echo TOKEN saved to clipboard!

