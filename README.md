# tyol-case

Tüm sorularda "run.sh" çalıştırılması yeterlidir.
Server-2 ve Server-3 de container yapıda istenen uygulamalar tek bir folder altında toplandı ve ansible-playbook ile sunuculara gönderildi.


Aşağıdaki adreslerden erişebilirsiniz

http://8.208.115.30:5601/app/kibana#/home

http://8.208.95.65:9093/#/alerts

http://8.208.115.30/users/password/edit?reset_password_token=rTHVdwz6qXe_yRZ8Lw4d

http://8.208.115.30:9200/

http://8.208.90.128:31841/login

1-1) 

Kubespray ve ansible-playbook ile kubernetes clusterı oluşturuldu. Istenilen env'lar k8s-cluster.yml,hosts.yml ve inventory.ini içerisinde verildi.

#kubespray "git clone https://github.com/kubernetes-incubator/kubespray.git" ile locale alındı ve hosts.yml düzenlendi.

$chmod 600 tycase.pem
$pip install --upgrade setuptools

$sudo pip install -r requirements.txt  (/kubespray/requirements.txt)

$https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/    (kubectl installation document)

![image](https://user-images.githubusercontent.com/47417469/116604249-89ca5980-a936-11eb-8ea8-5d379145695b.png)



1-2) 

Prometheus için helm values.yml düzenlendi, toleration olarakta server1 verildi.

$curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

$chmod 700 get_helm.sh

$./get_helm.sh

$helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

$helm repo add stable https://charts.helm.sh/stable

$helm repo update

![image](https://user-images.githubusercontent.com/47417469/116604873-63f18480-a937-11eb-9c92-2cedb4fb71c3.png)


1-3) 

Node taint effecti NoSchedule olarak değiştirilerek node'a deployment önlenir, "NoSchedule-" ile node tekrar schedule edilebilir duruma getirilir.

1-4) 

Nginx ingress helm values.yml ile ayağa kaldırıldı.


2-0)
Server 2 üzerinde tek nodeluk bir cluster oluşturuldu. Helm values.yml ile consul ayağa kaldırıldı, bağımlılığı olan secretta ayrı bir ymlda encode şekilde verildi.


![image](https://user-images.githubusercontent.com/47417469/116711958-08c59d80-a9dc-11eb-928a-a67047836aea.png)



3-0) 
Ansible ile prometheus container olarak ayağa kaldırıldı, consul keyide env olarak verildi.

4-0)
İstenilen metrikler için dashboar.json oluşturuldu ve grafana  values.yml ile ayağa kaldırıldı.

helm repo add stable https://charts.helm.sh/stable
helm repo update

Admin kullanıcı bilgileri yml içerisinde yer almaktadır

![image](https://user-images.githubusercontent.com/47417469/116751331-8903f700-aa0c-11eb-8c53-8be15c9f7c67.png)


5-0)
Server2-3 için oluştulan foldera ansible-playbook ile deploy olacak şekilde eklendi. Pod_restart için alarm tanımıda alerts.yml içerisien yapıldı.

6-0)
Ansible-playbook ile deploy edilecek şekilde server2-3 folderına eklendi.

7-0)
Gitlab-ce docker imajı ile container çalıştırıldı, pipeline içinde gitlab-ci.yml da ekte yer alıyor.

