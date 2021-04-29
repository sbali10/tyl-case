# tyol-case

1-1 "run-cluster.sh çalıştırılması yeterlidir"

Kubespray ve ansible-playbook ile kubernetes clusterı oluşturuldu.

#kubespray "git clone https://github.com/kubernetes-incubator/kubespray.git" ile locale alındı ve hosts.yml düzenlendi.

$sudo pip3 install -r kubespray/release-master/requirements.txt

$chmod 600 tycase.pem


![image](https://user-images.githubusercontent.com/47417469/116604249-89ca5980-a936-11eb-8ea8-5d379145695b.png)



1-2 "run.sh çalıştırılması yeterlidir"

Helm paket yöneticisi kullanılarak prometheus-values.yml oluşturulud.

$curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
$chmod 700 get_helm.sh
$./get_helm.sh
$helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$helm repo add stable https://kubernetes-charts.storage.googleapis.com/
$helm repo update

![image](https://user-images.githubusercontent.com/47417469/116604873-63f18480-a937-11eb-9c92-2cedb4fb71c3.png)


1-3 "run.sh çalıştırılması yeterlidir"

Node taint'i NoSchedule olarak değiştirilerek node'a deployment önlenir, aşağıdaki komut ile node tekrar schedule edilebilir duruma getirilir.

1-4 "run.sh çalıştırılması yeterlidir"

Helm values.yml ı kullanıldı.


$kubectl taint nodes node2 node=server1:NoSchedule-

