kubectl delete -f srcs/yamls/ &
echo "Waiting for PersistentVolume destroy"
mysql_pv=''
printf "."
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"
kubectl get pv 2>&1 | grep No > /dev/null
while [[ $? != 0 ]]
do
	for i in "${spin[@]}"
	do
			echo -ne "\b$i"
			sleep 0.1
	done
	printf "\b.."
	kubectl get pv 2>&1 | grep No > /dev/null
done
sh setup.sh
