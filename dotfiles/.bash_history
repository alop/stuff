assh mcp1
assh mcp3
assh mcp1
assh mcp3
source ~/.axion/env 
cd ansible-systems
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
assh mcp1
cd
cd git/openstack/kolla-kubernetes/
git pull
ag service_resources.yml
find . -name service_resources.yml
git blame etc/kolla-kubernetes/service_resources.yml
cd ../kolla-ansible/
ls etc/kolla/
cd
cd git/cisco/zen/
vi Dockerfile 
grep -i ssh ~/.axion/env 
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
vi inventory/inventory.ini 
ansible-playbook -i inventory/inventory.ini cluster.yml --become
vi inventory/inventory.ini 
ansible-playbook -i inventory/inventory.ini cluster.yml --become
assh util1
assh mhv1
assh mhv2
assh mhv1
cd
find . -name google-authenticator.txt
find Downloads/ -name "google*"
cat Downloads/google-authenticator.asc 
cd ansible-systems
vim
assh util1
assh mcp2
ssh proxmox11.prod1.lab.dfj.io 
ssh admin@172.29.54.241
cd git/openstack/kolla-kubernetes/
vi tests/bin/deploy_compute_kit.sh 
cd
sudo ./split-route.sh 
sudo ./unrereoute.sh 
source ~/.axion/env 
cd ansible-systems
git checkout master
git pull
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
host 172.29.84.70
host jenkins.ctocllab.cisco.com
host jenkins1.ctocllab.cisco.com
assh mhv1
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
assh nfs1
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
docker images
docker tag
docker tag a679ba214fb6:previous
docker tag a679ba214fb6 containers.cisco.com/harmony/oscore:previous
docker images
docker push containers.cisco.com/harmony/oscore:previous
cd
cd git/cisco/zen/
git log
vi scripts/helm_build.bash 
docker build .
vi Dockerfile 
docker build .
docker images
docker tag 424f67a222c0 containers.cisco.com/harmony/oscore:testing
docker push containers.cisco.com/harmony/oscore:testing
grep localhost helm/*
grep -R localhost helm/*
grep localhost scripts/*
vi helm/compute-kits/oscore-kit/requirements.yaml 
vi Dockerfile 
vim
docker build .
docker run -it --entrypoint=/bin/bash 232c7e090a4c
docker images
docker images -h
docker
docker images
docker rmi 424f67a222c0
docker images
docker rmi a679ba214fb6
docker tag 232c7e090a4c containers.cisco.com/harmony/oscore:testing
docker rmi a679ba214fb6
docker images
docker push containers.cisco.com/harmony/oscore:testing
docker tag 232c7e090a4c containers.cisco.com/harmony/oscore:demo
docker push containers.cisco.com/harmony/oscore:demo
docker images
docker run -it --entrypoint=/bin/bash 232c7e090a4c
vi scripts/kolla-entrypoint.bash 
docker run -it --entrypoint=/bin/bash 232c7e090a4c
vi scripts/kolla-entrypoint.bash 
docker build .
docker tag
docker tag ba5c0140dcc9 containers.cisco.com/harmony/oscore:demo
docker images
docker push containers.cisco.com/harmony/oscore:demo
vim
docker run -it --entrypoint=/bin/bash 232c7e090a4c
ls ~/root
assh mcp1
host 172.18.100.14
assh mcp1
cd ansible-systems
vim
source ~/.axion/env 
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
git checkout master
git log
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
ls playbooks/
ls playbooks/openstack/
vi playbooks/openstack/README.md 
ansible-playbook playbooks/openstack/axion_proxmox_snapshot_take.yml -e "snapshot=k8sready"
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
assh util1
cd
cd git/k8s/kargo/
ls
vi README.md 
assh util1
assh mcp1
git pull
ls
vi vagrant/config.rb 
vagrant up
vagrant destroy 
vagrant up
vagrant destroy 
deactivate 
workon kargo
ls
pip install -r requirements.txt 
vagrant up
deactivate 
assh mcp1
cd git/cisco/zen/
git remote -v
git checkout -b demo
git status
git commit -a
git push alop demo
git remote -v
cd ansible-systems
vim
ag admin_snat_ip
vi roles/cisco.admin_gateway/tasks/pacemaker.yml 
ag pacemaker_admin_gateway_service_net_vip 
ag service_network
ssh -F ~/.axion-fusion/ssh_config util1
ssh -F ~/.axion-fusion/ssh_config mhv1
ssh -F ~/.axion-fusion/ssh_config mcp1
ssh -F ~/.axion-fusion/ssh_config mhv1
ag resolv_conf_nameservers
vim
cd
cd git/k8s/kargo/
vi inventory/inventory.
vi inventory/inventory.ini 
ansible-playbook -i inventory/inventory.ini cluster.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/inventory.ini cluster.yml --become
vi inventory/inventory.ini 
ls
vi README.md 
vi inventory/inventory.ini 
ansible-playbook -i inventory/inventory.ini cluster.yml --become
assh mcp1
ansible-playbook -i inventory/inventory.ini cluster.yml --become
vi inventory/inventory.ini 
ansible-playbook -i inventory/inventory.ini cluster.yml --become
git remote -v
cd
cd ansible-systems
git remote -v
git remote add tyler
git remote add tyler git@github.com:tynorth-cisco/ansible-systems.git
git fetch tyler
git checkout tyler/vulcan-379
git checkout -b vulcan-379
git log
git show
vi playbooks/openstack/README.md
git add playbooks/openstack/README.md
git commit
git push tyler vulcan-379
history
assh mcp1
git status
git checkout master inventory/fusion/metapod/defaults/networks.yml
assh util1
vim
assh util1
vim
ssh proxmox11.prod1.lab.dfj.io 
rm -rf .virtualenvs/kargo/
workon kargo
mkvirtualenv kargo
cd git/k8s/kargo/
pip install -r requirements.txt 
vagrant up
vagrant destroy 
vagrant up
vagrant destroy 
git log
git checkout ac96d5ccf093974fca67ae87f235769c685ea718
vagrant up
vagrant destroy 
git log
ping 172.16.11.160
ping 10.10.11.160
ssh proxmox11.prod1.lab.dfj.io 
host proxmox11.prod1.lab.dfj.io
assh mcp2
workon kargo
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cal
cal 4 2017
assh mhv1
assh mcp3
assh mhv1
cd ansible-systems
cd venv/
ls
vim
vi .axion/ssh_config 
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cd
cd ansible-systems
git pull
git tag -h
git tag -l | wc -l
git log --oneline | wc -l
git log --oneline --no-merges | wc -l
cd
vi .axion/ssh_config 
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cd
cd ansible-systems
git pull
git tag -h
git tag -l | wc -l
git log --oneline | wc -l
git log --oneline --no-merges | wc -l
cd
vi .axion/ssh_config 
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cd
cd ansible-systems
git pull
git tag -h
git tag -l | wc -l
git log --oneline | wc -l
git log --oneline --no-merges | wc -l
cd
assh mcp3
assh util1
clear
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
cd git/k8s/kargo/
git checkout selinux 
git checkout -- inventory/group_vars/all.yml
git checkout selinux 
git status
workon kargo
ansible-playbook -i inventory/inventory.ini cluster.yml --become
deactivate 
cd
cd git/cisco/zen/
git remote
git remote -v
alias
vim
ssh admin@172.29.54.240
assh util1
assh mcp1
cd git/k8s/kargo/
vim
git blame roles/etcd/tasks/check_certs.yml
git show a422ad0d
assh mcp1
assh mcp3
cd
cd git/cisco/zen/
git pull
git checkout submodules
git checkout -b submodules
ls -la
git submodule add git@github.com:openstack/kolla-kubernetes.git
cd
ls .axion
rsync -Pav     -e 'ssh -F ~/.axion/ssh_config' --rsync-path='sudo rsync' util1:/etc/kubernetes/ssl .axion/.kubernetes
ls ~/.axion/ssh_config
rsync -Pav     -e 'ssh -F .axion/ssh_config' --rsync-path='sudo rsync' util1:/etc/kubernetes/ssl .axion/.kubernetes
kubectl config view
rsync -Pav     -e 'ssh -F .axion/ssh_config' --rsync-path='sudo rsync' util1:/etc/kubernetes/ssl .kubernetes-proxprod1/
kubectl config view
kubectl config use-context prodprox1
kubectl get nodes
workon zen
mkvirtualenv zen
cd git/cisco/zen/
git checkout master
git status
rm -rf .gitmodules 
rm -rf kolla-kubernetes/
git reset --hard
git status
rm -rf scripts/abelopez.asc 
rm -rf scripts/non_cinder_workflow.sh 
pip install kolla-ansible
./scripts/credentials.bash 
kubectl label node mcp1 kolla_conductor=true
kubectl label node mcp2 kolla_conductor=true
kubectl label node mcp3 kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm init
helm init --help
helm init --kube-context proxprod1
helm init --kube-context prodprox1
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods -n kolla -w
kubectl logs -f -n oscore kubectl get pods --selector=job-name=oscore-deploy-job -n oscore --output=jsonpath={.items..metadata.name}
kubectl get pods -n oscore -w
kubectl get pods --all-namespaces
kubectl get pods -n kolla -w
kubectl get pods -n kolla
kubectl describe pod mariadb-0                                         0/1       CrashLoopBackOff   20         1h
kubectl describe pod mariadb-0 -n kolla
kubectl label node mcp3 kolla_conductor=true-
kubectl label node mcp3 kolla_conductor=false
kubectl label node mcp3 kolla_conductor=false --overwrite
kubectl label node mcp2 kolla_conductor=false --overwrite
kubectl label node util1 kolla_conductor=false --overwrite
kubectl get all -n oscore
kubectl delete jobs/oscore-deploy-job -n oscore
kubectl get all -n kolla
kubectl delete deployments -n kolla
kubectl delete deployments --all -n kolla
kubectl get all -n kolla
kubectl delete jobs --all -n kolla
kubectl get all -n kolla
kubectl delete all --all -n kolla
kubectl get all -n kolla
kubectl delete all --all -n kolla
kubectl get all -n kolla
kubectl get all --all-namespaces
cd
vi github-token
deactivate 
workon kargo
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cd
rsync -Pav     -e 'ssh -F .axion/ssh_config' --rsync-path='sudo rsync' util1:/etc/kubernetes/ssl .kubernetes-proxprod1/
kubectl get nodes
kubectl get pods --all-namespaces
helm init --kube-context prodprox1
kubectl get pods --all-namespaces
workon zen
pip freeze
cd git/cisco/zen/
./scripts/credentials.bash 
ls doc/source/orchestration/
cd doc/source/orchestration/
cp vharmony_vagrant.rst vharmony_proxmox.rst 
cd
cd ansible-systems
vi /Users/abelopez/.axion/axion_hosts 
cd
cd git/k8s/kargo/
ls
vi inventory/inventory.ini 
cd
ls .kubernetes-proxprod1/
ls .kubernetes-proxprod1/ssl/admin-util1.lab011007.proxprod1.dfj.io*
kubectl config view
cd git/cisco/zen/
./scripts/credentials.bash 
kubectl label --overwrite svc kubedns k8s-app=kube-dns -n kube-system
kubectl label node mcp1 kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods -n kolla -w
kubectl get pods -n kolla 
kubectl get pods -n kolla -o wide
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
cd git/cisco/zen/
docker build .
git status
git commit -a
git push alop demo
git log
vim
git rebase --abort
git checkout master
git pull
git log
cd ../../openstack/kolla-kubernetes/
git pull
ag Ingress
restview doc/source/service-security.rst 
assh util1
source ~/.axion/env 
cd
cd ansible-systems
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
assh util1
assh -A util1
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox playbooks/openstack/axion_proxmox_provision.yml -e 'slot=7 proxmox=11 deploy_model=ha storage_model=nfs lab=proxprod1 provision_util=True guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2'
git log
git config
git config -l
cd
deactivate 
cd git/cisco/zen/
git pull
git checkout proxmox-docs-update
git checkout -b proxmox-docs-update
vim
git status
git add doc/source/orchestration/vharmony_proxmox.rst
git add doc/source/orchestration/vharmony_vagrant.rst
git add doc/source/orchestration/index.rst
git commit
git review
date -u
cd ../ansible-
cd ../ansible-systems/
git checkout 4.1.6/hotfix 
git pull 4.1.6/hotfix
git pull origin 4.1.6/hotfix
ag mon_initial_members
cd roles/ceph.ceph-common/
vim
cd ../../
ag mon_group_name
cd
kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 9090 -n=kube-system &
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
assh util1
assh mcp1
assh util1
assh nfs1
assh util1
assh mhv1
assh util1
assh mcp1
assh mcp2
assh mhv1
assh mcp2
assh util1
assh mhv1
assh -A mhv1
assh util1
assh -A mhv1
assh mcp1
assh util1
assh mhv1
assh util1
clear
assh util1
cd git/cisco/zen/
git checkout vagrant-doc-update 
git stash
git checkout vagrant-doc-update 
git lgo
git log
git checkout master
git pull
git checkout vagrant-doc-update 
git rebase origin/master 
git status
vim
cd ../../
cd k8s/
git clone https://github.com/kubernetes/ingress.git
cd ingress/
git checkout -b doc-updates
vim
cd ../kargo/
git checkout master
git pull
ag external
rm -rf zen
ag external
rm -rf kolla-kubernetes/
ag external
ag kubedns
ag external
cd
cd ansible-systems
ad pure
ag pure
vim
cd -
cd git/k8s/ingress/
git stash
git checkout master
git pull
find . -name default-backend.yaml -exec grep replication
find . -name default-backend.yaml -exec grep replication {} \;
find . -name default-backend.yaml 
vim
cd ../kargo/
git pull
ls
cd inventory/
ls
vi inventory.example 
cd ..
vim
cd .vim
ls
cd bundle/
ls
vi ~/.vimrc
cd
cd ansible-systems
vim
vi ~/.vimrc
vim
cd ansible-systems
git checkout master
git stauts
git status
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
git status
mv playbooks/openstack/metapod/prepare_k8s.yml playbooks/misc/
git add playbooks/misc/prepare_k8s.yml
git checkout -b kargo-prep
git checkout -- playbooks/openstack/axion_proxmox_snapshot_take.yml
git status
git commit
git push alop kargo-prep 
cd
deactivate 
cd git/cisco/zen/
git checkout master
git pull
git checkout -b proxmox-prep
vim
git add doc/source/orchestration/vharmony_proxmox.rst
git commit
git review
cd
cd git/k8s/kargo/
vi README.md 
vim
cd -
cd git/cisco/zen/
vim
git add doc/source/orchestration/vharmony_proxmox.rst
git commit --amend
git review
assh mcp1
assh util1
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
cd ansible-systems
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
make clean
make
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/metapod/prepare_k8s.yml --become
kubectl get nodes
docker push filez.lab.dfj.io:5000/oscore
date
cd git/cisco/zen/
git pull
docker build .
docker tag
docker tag b25936067442 filez.lab.dfj.io/oscore
docker push filez.lab.dfj.io/oscore
docker tag b25936067442 filez.lab.dfj.io:5000/oscore
docker push filez.lab.dfj.io:5000/oscore
docker tag b25936067442 http://filez.lab.dfj.io:5000/oscore
docker push filez.lab.dfj.io:5000/oscore
workon kargo
cd git/k8s/kargo/
git checkout master
git pull
vi vagrant/config.rb 
vagrant destroy
vagrant up
vi inventory/group_vars/all.yml 
vagrant provision
pip freeze | grep jin
pip freeze | grep ansi
vagrant destroy
jinfo 
minikube docker-env
eval $(minikube docker-env)
docker ps
docker exec -it baeb16fd5252 bash
minikube start --help
minikube version
docker run -ti -v /etc/localtime:/etc/localtime:ro busybox /bin/sh
cat .minikube/machines/minikube/config.json | grep DriverName
cat .minikube/machines/minikube/config.json | grep ISO
cat .minikube/machines/minikube/config.json | grep -i ISO
minikube start
kubectl get pods
kubectl get pods --all-namespaces
kubectl get nodes
minikube stop
minikube --help
minikube delete
which minikube
ls -lart Downloads/
chmod +x Downloads/minikube-darwin-amd64 
sudo mv Downloads/minikube-darwin-amd64 /usr/local/bin/minikube 
minikube start
kubectl get nodes
kubectl get pods
kubectl get pods --all-namespaces
helm init
kubectl get pods --all-namespaces
cd git/cisco/zen/
git checkout master
git pull
kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 9090 -n=kube-system &
kubectl get pods --all-namespaces
kubectl delete pod kubernetes-dashboard-3203962772-37zvm -n kube-system
export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 9090 -n=kube-system &
workon zen
./scripts/credentials.bash 
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -o wide
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
minikube delete
kubectl get pods --all-namespaces -w
minikube --help
minikube --vm-driver xhyve --cpus 4 --memory 4096
minikube start --vm-driver xhyve --cpus 4 --memory 4096
xhyve
brew install xhyve
xhyve
minikube start --vm-driver xhyve --cpus 4 --memory 4096
brew install docker-machine-driver-xhyve --HEAD
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
minikube start --vm-driver xhyve --cpus 4 --memory 4096
helm init
kubectl get pods --all-namespaces
./scripts/credentials.bash
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
kubectl get pods --all-namespaces
kubectl get pods -n kolla
kubectl get pods -n kolla -w
kubectl describe mariadb-init-element-n26ff -n kolla
kubectl describe pod mariadb-init-element-n26ff -n kolla
minikube stop
minikube --help
minikube start --vm-driver xhyve --cpus 4 --memory 4096
minikube delete
minikube start --help
minikube start --vm-driver virtualbox --cpus 4 --memory 4096
kubectl get pods --all-namespaces
kubectl label node minikube kolla_conductor=true
helm init
kubectl get pods --all-namespaces
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods -n kolla -w
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
kubectl describe pod mariadb-init-element-znbk8 -n kolla
minikube delete
cd ../../
cd k8s/
git clone git@github.com:kubernetes/minikube.git
cd minikube/
ls
cd deploy/
ls
cd iso
ls
cd minikube-iso/
ls
vim
ag localtime
vim
cd ../../
cd ..
make buildroot-image
make out/minikube.iso
cd
minikube start --vm-driver xhyve --cpus 4 --memory 4096
minikube ssh
kubectl label node minikube kolla_conductor=true
cd git/cisco/zen/
ls
kubectl create namespace oscore
helm init
kubectl get pods
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
kubectl get pods --all-namespaces
kubectl get pods -n kolla
kubectl get pods -n kolla -w
kubectl describe pod openvswitch-set-external-ip-q8bs8 -n kolla
kubectl get pods -n kolla
watch kubectl get pods -n kolla
history
history | grep port
minikube stop
minikube start
minikube start --vm-driver xhyve --cpus 4 --memory 4096
kubectl get pods -n kolla
export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
history | grep horizon
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
kubectl get pods -n kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
kubectl get pods -n kolla
kubectl get deployments
kubectl get deployment -n kolla
minikube stop
minikube delete
minikube start --vm-driver xhyve --cpus 4 --memory 4096
minikube ssh
helm init
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods -n kolla -w
kubectl get pods --all-namespaces -w
git pull
vim
git status
git checkout -b minikube
git add doc/source/orchestration/minikube.rst
git commit
git review
history | grep minik
grep axion .bashrc
grep ANSIBLE .bashrc
ssh proxmox11.prod1.lab.dfj.io 
eval $(minikube docker-env)
minikube dashboard
history | grep horizon
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
history | grep port-forw
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
kubectl get pods --all-namespaces
minikube delete
cd ze
cd git/cisco/zen/
git status
restview doc/source/orchestration/minikube.rst 
cd git/openstack/kolla-kubernetes/
git pull
ag system=nova-compute
ag nova-compute
vim
cd
kubectl get pods -n kolla
minikube delete
watch kubectl get jobs -n kolla
watch kubectl get jobs,svc -n kolla
eval $(minikube docker-env)
minikube dashboard
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
assh util1
kubectl get pods -n kolla
kubectl config view
kubectl config set-context prodprox1
kubectl get pods -n kolla
assh util1
telnet localhost 8899
nc -v localhost:8899
nc -v localhost 8899
history | grep 9090
history | grep kube-system
export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 9090 -n=kube-system &
netstat -an | grep 9090
lsof -i :9090
ps -ef | grep 23160
kill 23160
lsof -i :9090
kubectl port-forward $POD_NAME 9090 -n=kube-system &
kubectl get pods -n kolla | grep console
kubectl get pods -n kolla | grep nova
kubectl get services -n kolla
kubectl port-forward nova-novncproxy-2374704535-53qn8 6080 -n kolla
cd git/cisco/zen/
git checkout master
git pull
vim
git status
git checkout -b HMS-108
git add helm/service/ironic/values.yaml
vim
git status
git reset --hard
git log
git status
vim
vi /Users/abelopez/.vimrc
vim
cd ~/git/openstack/kolla-kubernetes/
cd helm/
ls
cd microservice/
ls
cp -rf ironic-api-create-db-job ironic-create-db-job
cp -rp ironic-api-manage-db-job ironic-manage-db-job
git status
git add ironic-create-db-job/
git add ironic-manage-db-job/
git commit --amend
git push alop ironic-deps 
git push -falop ironic-deps 
git push -f alop ironic-deps 
vim
kubectl get jobs,svc -n kolla
watch kubectl get jobs,svc -n kolla
kubectl describe pod ironic-conductor-9hhnk  -n kolla
helm list
helm search ironic-conductor
helm dependency list kolla/ironic-conductor-daemonset
helm dependency list local/ironic-conductor-daemonset
helm dependency list ironic-conductor-daemonset
helm dependency list 
helm dependency list -h
helm dependency list oscore-kit
cd git/cisco/zen/
cd helm/
helm dependency list oscore-kit
ls
helm dependency list compute-kits/oscore-kit
cd ../../
cd ../openstack/kolla-kubernetes/
cd helm/
ls
helm dependency list service/ironic
helm dependency list service/nova-control
cd service/
helm dependency list ironic
ls
vi ironic/requirements.yaml 
cd ironic/
helm dependency list ironic
helm dependency list .
kubectl describe pod ironic-manage-db-p7lfl -n kolla
kubectl logs ironic-manage-db-p7lfl -n kolla
helm list
minikube ssh
kubectl logs ironic-manage-db-p7lfl -n kolla
kubectl delete pod ironic-manage-db-p7lfl -n kolla
kubectl describe pod ironic-manage-db-fdnsr -n kolla
cd ../../
vim
git status
git add service/ironic/requirements.yaml
git add service/ironic/values.yaml
git commit --amend
git push -f alop ironic-deps 
helm search ironic
vi /Users/abelopez/.vimrc 
cd ansible-systems
vim
kubectl config view
kubectl config -h
kubectl config get-contexts
kubectl config set-context prodprox1
kubectl config get-contexts
kubectl config use-context prodprox1
kubectl config get-contexts
kubectl get pods -n kolla
export HORIZON_POD_NAME=$(kubectl get pods -n kolla -l "service=horizon" -o jsonpath="{.items[0].metadata.name}") 
kubectl port-forward $HORIZON_POD_NAME 8080:80 -n=kolla
docker pull containers.cisco.com/harmony/oscore:newton
cd git/cisco/zen/
vim
docker build .
docker tag e0c12bb10a13 filez.lab.dfj.io/oscore:testing
docker images
docker tag e0c12bb10a13 filez.lab.dfj.io:5000/oscore:testing
docker push filez.lab.dfj.io:5000/oscore:testing
vim
git status
vim
ls
rm -rf helm/service/nova-compute-ironic/
vim
docker images
docker rmi ab7d678faae0
docker rmi -f ab7d678faae0
docker build
docker build .
docker tag bc3a035876c4 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch jobs -n kolla
watch kubectl get jobs -n kolla
vim
cd ../../openstack/kolla-kubernetes/
cd helm/microservice/ironic-api-create-db-job/
helm dep up
helm dep list
cd ../
cd ../service/ironic/
helm dep list
cd ../nova-control/
helm dep list
ls ../../microservice/nova-api-svc
helm dep up
helm dep list
cd ../
cd ironic/
helm dep up
helm dep list
cd ../../
cd microservice/
cd ~/git/cisco/zen/
ls
ls helm/
ls helm/service/
rm -rf helm/service/
vi Dockerfile 
ag service
ag ironic
cd -
vim
watch kubectl get jobs -n kolla
cd -
docker images
docker rmi -f bc3a035876c4
docker build .
docker tag e2d92fe76381 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
docker images
watch kubectl get jobs -n kolla
docker rmi -f e2d92fe76381
docker build .
docker tag 01b3a73824fd 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
docker rmi -f 01b3a73824fd
docker build .
docker tag 17480fa5eda9 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
docker rmi -f 17480fa5eda9
docker build .
docker tag c7701e422f22 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
vim ../../openstack/kolla-kubernetes/
vim ../../openstack/kolla-kubernetes/.
docker rmi -f c7701e422f22
docker build .
docker tag 7ee662c312a5 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
vim
cd ../../openstack/kolla-kubernetes/
vim
cd -
docker images
docker rmi -f 7ee662c312a5
docker build .
docker tag df3e29626188 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
docker rmi -f df3e29626188
docker build .
docker tag e11d3d17c6bb 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
minikube ssh
cd -
vim
cd -
vim
vi Dockerfile 
docker images
docker rmi -f e11d3d17c6bb
docker build .
docker tag abb0a95fb25a 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
watch kubectl get jobs -n kolla
git checkout master
git pull
git stash
git pull
git log
git branch -D HMS-108
git checkout -b HMS-108
vim
docker build .
docker tag fe2520148196 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
minikube ssh
kubectl get configmap -n kolla
kubectl edit configmap nova-api -n kolla
kubectl edit configmap nova-compute -n kolla
kubectl edit configmap nova-conductor -n kolla
kubectl edit configmap nova-libvirt -n kolla
kubectl edit configmap nova-schduler -n kolla
kubectl edit configmap nova-scheduler -n kolla
kubectl get pods -l service=nova -n kolla
kubectl delete pods -l service=nova -n kolla
kubectl get pods -l service=nova -n kolla
kubectl get pods -l system=nova-compute -n kolla
kubectl delete pods -l system=nova-compute -n kolla
kubectl get pods -l system=nova-compute -n kolla
kubectl get pods -n kolla | grep libv
cd git/openstack/kolla-kubernetes/
git pull
vim
ag SERVICE
git status
git remote -v
git remote add alop git@github.com:alop/kolla-kubernetes.git
git checkout -b ironic-deps
git add helm/service/ironic/values.yaml
git commit
git push alop ironic-deps 
vim
ag ironic-manage-db
ag ironic_manage_db
ag ironic
ag manage
ag manage_db
vim
git status
git checkout -- helm/service/ironic/values.yaml
git status
cd helm/microservice/
cd ..
vim
cd ..
vim
git log
git push alop ironic-deps 
vim
git reset --hard
git checkout master
git log
git branch -D ironic-deps 
gitp pull
git pull
git checkout -b ironic-deps
git log
vim
git status
vim
git stash
git log
git pull alop ironic-deps 
git log
vim
git status
git add tools/helm_prebuild_microservices.py
vim
git commit
git push alop ironic-deps 
git log
git show
grep ironic tools/helm_prebuild_microservices.py 
grep ironic tools/helm_prebuild_services.py 
git log
git checkout master
git branch -D ironic-deps 
git checkout -b ironic-deps
git stash list
git stash apply
git show
git status
vi helm/service/ironic/values.yaml 
git commit
git commit -a
git push -f alop ironic-deps 
vim
git log
git status
git diff --staged
git add helm/service/ironic/values.yaml
git add helm/microservice/ironic-api-manage-db-job/templates/ironic-api-manage-db.yaml
git diff --staged
git commit --amend
git push -f alop ironic-deps 
vim
git status
git add helm/service/ironic/values.yaml
git commit
git push alop testing-ironic-deps 
vim
git add helm/service/ironic/values.yaml
git commit --amend
git push -f alop testing-ironic-deps 
vim
git log
git commit --amend
git log
git review
git status
git add helm/service/ironic/values.yaml
git commit --amend
git reset --hard
git status
git add helm/service/ironic/values.yaml
git commit
git push -f alop ironic-deps 
git commit --amend
git add helm/service/ironic/values.yaml
git commit --amend
git push -f alop ironic-deps 
git show
git log
git show HEAD~2
git show HEAD~1
git rebase -i HEAD~1
git rebase -i HEAD~2
git rebase --abort
rm -rf helm/microservice/ironic-create-db-job/
rm -rf helm/microservice/ironic-manage-db-job/
git rm helm/microservice/ironic-manage-db-job/
git rm -r helm/microservice/ironic-manage-db-job/
git rm -r helm/microservice/ironic-create-db-job/
git status
git commit
vim
git status
git add helm/service/ironic/values.yaml
git commit 
git push -f alop ironic-deps 
ag ironic-create-db
ag ironic-api-create-db
vim
ag pod
:q
git status
find . -name requirements.lock
find . -name requirements.lock -exec rm {} \;
git status
git add helm/service/ironic/requirements.yaml
git add helm/service/ironic/values.yaml
git commit 
git push -f alop ironic-deps 
git show
cd helm/microservice/
ls
mv ironic-api-create-db-job ironic-create-db-job
mv ironic-api-manage-db-job ironic-manage-db-job
vim
cd ..
vim
git status
git add microservice/ironic-create-db-job/
git add microservice/ironic-manage-db-job/
git commit -a
git push alop ironic-deps 
cd microservice/
ls
mv ironic-api-create-keystone-endpoint-public-job ironic-create-keystone-endpoint-public-job
mv ironic-api-create-keystone-endpoint-admin-job ironic-create-keystone-endpoint-admin-job
mv ironic-api-create-keystone-endpoint-internal-job ironic-create-keystone-endpoint-internal-job
cd ..
vim
git status
git add microservice/ironic-create-keystone-endpoint-*
git status
git commit -a
git push alop ironic-deps 
git log
git checkout master
git branch -D ironic-deps 
git checkout -b ironic-deps
git log
minikube ssh
ag 3.0.3
ag 4.0.0
vim
git checkout master
git pull
git checkout -b testing-ironic-deps
vim
ag pxelinux
ag initialize
ag initialize-ironic
vo,
vim
minikube delete
minikube start --vm-driver xhyve --cpus 4 --memory 4096
minikube ssh
kubectl get pods --all-namespaces
helm init
kubectl get pods --all-namespaces
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
cd git/cisco/zen/
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
kubectl describe pod oscore-deploy-job-t6k3l -n oscore
minikube delete
curl ifconfig.io
host 173.36.240.175
minikube start --vm-driver xhyve --cpus 4 --memory 4096
minikube ssh
kubectl get pods --all-namespaces
helm init
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
watch kubectl get pods --all-namespaces
watch kubectl get pods -n kolla
kubectl get pods -n kolla
cat ~/.ssh/id_rsa.pub 
kubectl get configmap -n kolla
kubectl edit configmap nova-api -n kolla
kubectl edit configmap nova-compute -n kolla
kubectl delete pod -l service=nova type=api -n kolla
kubectl get pods -n kolla
kubectl describe pod nova-api-1445704220-t6wdl -n kolla
kubectl delete pod -l service=nova,type=api -n kolla
kubectl get pod -l service=nova,type=api -n kolla
kubectl get pod -l service=nova,type=compute -n kolla
kubectl get pod -l service=nova-compute -n kolla
kubectl get pods -n kolla
kubectl describe pod nova-compute-ttnvj -n kolla
kubectl delete pod nova-compute-ttnvj -n kolla
kubectl get pods -n kolla |grep compute
kubectl get pod -l system=nova-compute  -n kolla
kubectl get pods -n kolla |grep libvirt
kubectl get configmap -n kolla
kubectl edit configmap nova-libvirt -n kolla
kubectl edit configmap nova-compute -n kolla
kubectl delete pod -l system=nova-compute  -n kolla
kubectl get pod -l system=nova-compute  -n kolla
kubectl logs nova-compute-hfqwh -n kolla
docker ps
minikube --help
minikube status
kubectl help
kubectl attach
kubectl attach nova-compute-hfqwh -n kolla
kubectl attach -h
kubectl attach nova-compute-hfqwh -i -t -n kolla
minikube ssh
kubectl get pod -l service=nova,type=scheduler -n kolla
kubectl delete pod -l service=nova,type=scheduler -n kolla
kubectl get pod -l service=nova,type=scheduler -n kolla
minikube delete
top -o cpu
kubectl config view
kubectl set context
kubectl config set-context prodprox1
kubectl get pods -n kolla
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
history | grep 8899
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
minikube start --vm-driver xhyve --cpus 4 --memory 4096
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm init
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods -n kolla -w
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
kubectl describe pod oscore-deploy-job-f1493 -n oscore
kubectl get pods --all-namespaces -w
minikube delete
vim
ag containers.cisco
vi helm/deploy/oscore-deployment/values.yaml
minikube start --vm-driver xhyve --cpus 4 --memory 4096
kubectl create namespace oscore
helm init
kubectl label node minikube kolla_conductor=true
kubectl get pods --all-namespaces -w
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
vi helm/deploy/oscore-deployment/values.yaml
kubectl get pods --all-namespaces -w
kubectl delete pod oscore-deploy-job-r10r2 -n oscore
kubectl get pods --all-namespaces -w
kubectl get pods --all-namespaces
helm list
helm help
helm list
helm delete oscore-deployment
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment
vi helm/deploy/oscore-deployment/
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm list
helm list --all
helm delete oscore-deployment --purge
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl describe pod oscore-deploy-job-6l5ww -n oscore
helm delete oscore-deployment --purge
vi helm/deploy/oscore-deployment/
vi helm/deploy/oscore-deployment/values.yaml 
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
helm delete oscore-deployment --purge
vi helm/deploy/oscore-deployment/values.yaml 
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl describe pod oscore-deploy-job-mjr6h -n oscore
vi helm/deploy/oscore-deployment/values.yaml 
minikube delete
minikube start --vm-driver xhyve --insecure-registry="filez.lab.dfj.io:5000" --cpus 4 --memory 4096
minikube ssh
helm init
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
kubectl get pods --all-namespaces
vi helm/deploy/oscore-deployment/values.yaml 
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
minikube delete
vi helm/deploy/oscore-deployment/values.yaml 
minikube start --vm-driver xhyve --insecure-registry="filez.lab.dfj.io:5000" --cpus 4 --memory 4096
minikube ssh
helm init
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
kubectl get pods --all-namespaces -w
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
helm dependency
helm dependency list
helm list
helm dependency list oscore-kit
helm dependency list oscore-kit --kube-context minikube
watch kubectl get pods -n kolla
vim
minikube start --vm-driver xhyve --insecure-registry="filez.lab.dfj.io:5000" --cpus 4 --memory 4096
kubectl get pods --all-namespaces -w
minikube ssh
helm init
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
minikube delete
minikube start --vm-driver xhyve --insecure-registry="filez.lab.dfj.io:5000" --cpus 4 --memory 4096
minikube ssh
helm init
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
kubectl get pods --all-namespaces -w
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
helm delete oscore-deployment --purge
docker build .
vi Dockerfile 
docker build .
docker images | grep cd305d2b761d
docker images 
docker rmi 
docker rmi 71412a55d6d3
docker images 
docker rmi e0c12bb10a13
docker rmi -f e0c12bb10a13
docker build .
minikube start --vm-driver xhyve --insecure-registry="filez.lab.dfj.io:5000" --cpus 4 --memory 4096
minikube ssh
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
helm delete oscore-deployment --purge
watch kubectl get pods -n kolla
minikube delete
minikube start --vm-driver xhyve --insecure-registry="filez.lab.dfj.io:5000" --cpus 4 --memory 4096
minikube ssh
kubectl get pods --all-namespaces -w
helm init
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
minikube help
git status
cp helm/service/ironic/values.yaml ../../openstack/kolla-kubernetes/helm/service/ironic/values.yaml 
docker images
docker rmi 90b1570e0186
docker build .
rm -rf helm/service/ironic/
docker tag 8c3464c92612 http://filez.lab.dfj.io:5000/oscore:testing
docker tag 8c3464c92612 filez.lab.dfj.io:5000/oscore:testing
docker push filez.lab.dfj.io:5000/oscore:testing
vi helm/deploy/oscore-deployment/values.yaml 
kubectl get pods --all-namespaces -w
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
helm delete oscore-deployment --purge
watch kubectl get pods -n kolla
helm list
helm delete oscore-kit --purge
docker images
docker rmi 8c3464c92612
docker build .
docker tag ca81092e8e0f localhost:5000/oscore:testing
docker push localhost:5000/oscore:testing
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
docker tag ca81092e8e0f filez.lab.dfj.io:5000/oscore:testing
docker push filez.lab.dfj.io:5000/oscore:testing
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-kit --purge
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-kit --purge
helm delete oscore-deployment --purge
helm list
helm repo
helm repo list
helm repo remove kolla
minikube delete
minikube start --vm-driver xhyve --insecure-registry="localhost:5000" --cpus 4 --memory 4096
minikube ssh
kubectl get pods --all-namespaces
helm init
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
docker build .
docker images
docker rmi ca81092e8e0f
docker rmi -f ca81092e8e0f
docker images
docker build .
docker tag ab7d678faae0 localhost:5000/oscore:testing
docker push localhost:5000/oscore:testing
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
minikube start --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
docker tag ab7d678faae0 10.0.1.4:5000/oscore:testing
docker push 10.0.1.4:5000/oscore:testing
minikube ssh
helm init
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-kit --purge
helm delete oscore-deployment --purge
kubectl delete namespace kolla
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-kit --purge
kubectl delete namespace kolla
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
kubectl delete namespace kolla
helm delete oscore-deployment --purge
helm list
helm search ironic
helm help
helm search ironic
helm inspect -h
helm inspect local/ironic-api-create-db-job 
helm inspect chart local/ironic-api-create-db-job 
helm repo
helm repo list
helm repo remove local
helm search ironic
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm search ironic
helm repo list
helm search ironic --kube-context minikube
helm repo list --kube-context minikube
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
minikube delete
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
minikube ssh
helm list
helm init
helm list
kubectl get pods --all-namespaces
helm list
helm list repo
help repo list
helm repo list
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
helm repo
helm repo list
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
kubectl delete namespace kolla
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
kubectl delete namespace kolla
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm repo list
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
minikube delete
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
kubectl get pods -n kube-system
helm init
kubectl get pods -n kube-system
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
kubectl get pods -n kube-system
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
ag prebuild
helm delete oscore-kit --purge
helm delete oscore-deployment --purge
kubectl delete namespace kolla
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
minikube delete -h
minikube delete 
ls ~/.helm/
rm -rf ~/.helm/
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
kubectl get pods --all-namespaces
helm init
kubectl get pods --all-namespaces
vi helm/deploy/oscore-deployment/values.yaml 
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deployment --purge
kubectl delete namespace kolla
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl logs oscore-deploy-job-q3rnk -n oscore
kubectl logs oscore-deploy-job-q3rnk -n oscore -w
kubectl logs oscore-deploy-job-q3rnk -n oscore -f
minikube delete
ls -l ~/.minikube/
ls -l ~/.minikube/cache/
ls -l ~/.minikube/cache/iso/
ls -l ~/.minikube/machines/
cd
ls -lart
rm -rf .helm/
ls .harmony/
rm -rf .harmony/
mv .minikube .minikube-old
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
minikube ssh
kubectl get pods --all-namespaces
ls -l .helm
helm init
kubectl create namespace oscore
cd -
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl logs oscore-deploy-job-p4dd0 -n oscore
kubectl logs oscore-deploy-job-p4dd0 -n oscore -f
helm search ironic
helm search nova
helm search neutron
helm repo list
helm repo -h
helm repo index local
helm repo index 
helm 
helm list
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
kubectl delete namespace kolla
kubectl get pods
kubectl get pods --all-namespaces
kubectl get pods -a
kubectl delete pod tiller-deploy-3066893457-pm5qz -n kube-system
rm -rf ~/.helm/
minikube ssh
helm init
helm init --upgrade
kubectl get pods --all-namespaces
helm repo list
helm repo remove local
helm repo list
kubectl get configmap --all-namespaces
kubectl get configmaps
kubectl get configmaps --all-namespaces
kubectl get namespaces
kubectl delete namespace oscore
kubectl create namespace oscore
kubectl get namespaces
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-5bxgf -n oscore -f
minikube delete
rm -rf ~/.minikube
rm -rf ~/.helm/
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
kubectl -h
kubectl get pods --help
kubectl get pods --all-namespaces
helm init
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl logs oscore-deploy-job-jw61r -n oscore -f
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
helm repo list
helm repo remove local
rm -rf ~/.helm/
kubectl get pods --all-namespaces
kubectl delete namespace oscore
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-fnjcv -n oscore -f
minikube delete
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
rm -rf ~/.helm
helm init
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-03rpb -n oscore
kubectl logs oscore-deploy-job-03rpb -n oscore -f
kubectl describe pod ironic-conductor-s7grt -n kolla
kubectl logs ironic-conductor-s7grt -n kolla
kubectl logs nova-compute-ironic-0 -n kolla
kubectl logs ironic-conductor-s7grt -n kolla
helm delete oscore-deployment --purge
helm delete oscore-kit --purge
kubectl delete namespace kolla
kubectl delete namespace oscore
vi helm/deploy/oscore-deployment/values.yaml 
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-dmn40 -n oscore -f
kubectl logs nova-compute-ironic-0 -n kolla
kubectl logs ironic-conductor-063s9 -n kolla -f
minikube delete
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
rm -rf ~/.helm/
kubectl get pods --all-namespaces
helm init
kubectl get pods --all-namespaces
kubectl label node minikube kolla_conductor=true
kubectl create namespace oscore
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-zbn0x -n oscore -f
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-zbn0x -n oscore -f
kubectl logs ironic-conductor-vtrnh -n kolla
minikube start --iso-url https://storage.googleapis.com/minikube-builds/1327/minikube-testing.iso --vm-driver xhyve --insecure-registry="10.0.1.4:5000" --cpus 4 --memory 4096
kubectl get pods --all-namespaces
rm -rf ~/.helm/
helm init
kubectl get pods --all-namespaces
kubectl create namespace oscore
kubectl label node minikube kolla_conductor=true
vim
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-nkrxr -n oscore -f
kubectl logs ironic-conductor-rmb2b -n kolla
kubectl logs oscore-deploy-job-nkrxr -c main -n oscore -f
kubectl logs ironic-conductor-rmb2b -n kolla
kubectl logs ironic-conductor-rmb2b -c main -n kolla
kubectl logs ironic-conductor-rmb2b -c pxe -n kolla
kubectl logs ironic-conductor-rmb2b -c main -n kolla
kubectl logs ironic-conductor-rmb2b -c pxe -n kolla
kubectl logs ironic-conductor-rmb2b -c main -n kolla
kubectl logs ironic-conductor-rmb2b -c pxe -n kolla
minikube delete
watch kubectl get jobs,svc -n kolla
watch kubectl get pods -n kolla
kubectl get namespace
kubectl delete namespace kolla
kubectl get all --all-namespaces
vi helm/deploy/oscore-deployment/values.yaml 
docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker ps
vi helm/deploy/oscore-deployment/values.yaml 
kubectl get pods --all-namespaces
kubectl describe pod oscore-deploy-job-zsjxc -n oscore
docker pull localhost:5000/oscore:testing
docker stop registry && docker rm -v registry
vi helm/deploy/oscore-deployment/values.yaml 
minikube start -h
kubectl get pods --all-namespaces
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
docker run -d -p 5000:5000 --restart=always --name registry registry:2
vi helm/deploy/oscore-deployment/values.yaml 
kubectl get pods --all-namespaces -w
kubectl describe pod oscore-deploy-job-rvt5k -n oscore
netstat -an | grep 5000
ip a
ifconfig -a
telnet 10.0.1.4 5000
minikube delete
vi helm/deploy/oscore-deployment/values.yaml 
kubectl get pods --all-namespaces -w
watch kubectl get pods -n kolla
kubectl get pods --all-namespaces -w
watch kubectl get pods,jobs
watch kubectl get pods,jobs --all-namespaces
watch kubectl get pods -n kolla
watch kubectl get pods --all-namespaces
watch kubectl get pods -n kolla
watch kubectl get pods --all-namespaces
watch kubectl get pods -n kolla
minikube delete
watch kubectl get pods -n kolla
kubectl config view
kubectl config use-context prodprox1
kubectl get contexts
kubectl config get contexts
kubectl config -h
kubectl config get-contexts
kubectl get pods
assh util1
curl ifconfig.co
host 173.36.240.17
assh mcp1
cd ansible-systems
source venv/bin/activate
source ~/.axion/env 
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
cd ansible-systems
source venv/bin/activate
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_provision.yml -e "proxmox=11 slot=7 deploy_model=ha storage_model=nfs provision_util=True"
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_provision.yml -e "proxmox=11 slot=7 deploy_model=ha storage_model=nfs provision_util=True lab=proxprod1"
source ~/.axion/env 
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/misc/prepare_k8s.yml --become
vi --become
vim
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_provision.yml -e "proxmox=11 slot=7 deploy_model=ha storage_model=nfs provision_util=True lab=proxprod1 guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2"
source ~/.axion/env 
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/misc/prepare_k8s.yml --become
env | grep SSH
cd
rsync -Pav     -e 'ssh -F .axion/ssh_config'     --rsync-path='sudo rsync'     util1:/etc/kubernetes/ssl proxmox/.kubernetes
rsync -Pav     -e 'ssh -F .axion/ssh_config'     --rsync-path='sudo rsync'     util1:/etc/kubernetes/ssl .kubernetes-proxprod1
helm init --kube-context proxmox
helm init --kube-context prodprox1
cd ansible-systems
vim
ag api
ag pacemaker_
ag pacemaker_
ag _vip
ag pacemaker_haproxy_service_network_vip
cd ..
cd git/cisco/zen/
vi Dockerfile 
docker build .
docker images
docker push filez.lab.dfj.io:5000/oscore:testing
cd ../ansible-
cd ../ansible-systems/
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
git checkout master
git pull
git log
git checkout 4.1.7/hotfix 
git pull origin 4.1.7/hotfix
git log
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_provision.yml -e "proxmox=11 slot=7 deploy_model=ha storage_model=nfs provision_util=True lab=proxprod1 guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2"
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_destroy.yml 
git checkout master
git pull
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/openstack/axion_proxmox_provision.yml -e "proxmox=11 slot=7 deploy_model=ha storage_model=nfs provision_util=True lab=proxprod1 guest_image_path=/root/CentOS-7-x86_64-GenericCloud.qcow2"
ansible-playbook -i inventory/fusion/metapod/proxmox/ playbooks/misc/prepare_k8s.yml --become
cd git/k8s/kargo/
export ANSIBLE_SSH_ARGS=-F /Users/abelopez/.axion/ssh_config
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
workon kargo
ansible-playbook -i inventory/inventory.ini cluster.yml --become
kubectl config get-contexts
kubectl get nodes
kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
export POD_NAME=$(kubectl get pods -n kube-system -l "app=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 9090 -n=kube-system &
pip install kolla-ansible
assh mcp1
vim
ansible-playbook -i inventory/inventory.ini cluster.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/inventory.ini cluster.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cd git/cisco/zen/
helm init --kube-context prodprox1
cd
rsync -Pav     -e 'ssh -F .axion/ssh_config'     --rsync-path='sudo rsync'     util1:/etc/kubernetes/ssl .kubernetes-proxprod1
assh utl1
assh util1
workon kargo
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
cd git/k8s/kargo/
ansible-playbook -i inventory/inventory.ini cluster.yml --become
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ssh -F ~/.axion/ssh_config util1
ls -lart
ls -lart /tmp/
rm /tmp/util1.lab011007.proxprod1.dfj.io 
rm /tmp/mcp*
ansible-playbook -i inventory/inventory.ini cluster.yml --become
ansible --version
man ansible
man ansible-playbook
vi ansible.cfg 
ansible-playbook -i inventory/inventory.ini cluster.yml --become
cat ~/.axion/ssh_config 
:q
cat ~/.axion/env 
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ansible-playbook -i inventory/inventory.ini cluster.yml --become
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
cd git/cisco/zen/
ls
assh mcp1
vim
kubectl get pods --all-namespaces
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl create namespace oscore
kubectl label node util1 kolla_conductor=true
kubectl label node mcp1 kolla_compute=true
kubectl label node mcp2 kolla_compute=true
kubectl label node mcp3 kolla_compute=true
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
helm delete oscore-deploymnet --purge
helm delete oscore-deployment --purge
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
helm delete oscore-deployment --purge
kubectl get pods --all-namespaces
docker images
docker build .
docker tag 9d08c4732b21 filez.lab.dfj.io:5000/oscore:testing
docker push filez.lab.dfj.io:5000/oscore:testing
docker tag 04be478cb4a6 filez.lab.dfj.io:5000/oscore:testing
docker push filez.lab.dfj.io:5000/oscore:testing
vi helm/deploy/oscore-deployment/values.yaml 
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
kubectl describe pod oscore-deploy-job-gwvqk -n oscore
helm delete oscore-deployment --purge
vim
ssh devstation 
ssh
man ssh
ssh -Y devstation
ssh devstation 
rsync -Pav     -e 'ssh -F .axion/ssh_config'     --rsync-path='sudo rsync'     util1:/etc/kubernetes/ssl .kubernetes-proxprod1
kubectl get nodes
rsync -Pav     -e 'ssh -F .axion/ssh_config'     --rsync-path='sudo rsync'     util1:/etc/kubernetes/ssl .kubernetes-proxprod1
kubectl get nodes
assh util1
cd git/k8s/kargo/
vi inventory/inventory.ini 
cd inventory/
cp inventory.ini inventory.ini.old
cp ~/.axion/axion_hosts inventory.ini
vi inventory.ini
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
workon kargo
cd ../
ansible-playbook -i inventory/inventory.ini cluster.yml --become
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
vi inventory/inventory.ini
ssh -L 8899:172.16.7.172:443 proxmox11.prod1.lab.dfj.io 
assh util1
ssh -L 8899:172.16.11.172:443 proxmox11.prod1.lab.dfj.io 
ssh -L 8899:172.18.7.172:443 proxmox11.prod1.lab.dfj.io 
ssh proxmox2.prod1.lab.dfj.io
workon kargo
cd git/k8s/kargo/
export ANSIBLE_SSH_ARGS="-F /Users/abelopez/.axion/ssh_config"
ls /Users/abelopez/.axion/ssh_config 
cat /Users/abelopez/.axion/ssh_config
ssh -F ~/.axion/ssh_config util1 uptime
ansible-playbook -i inventory/inventory.ini cluster.yml --become
vi /Users/abelopez/.axion/axion_hosts 
view inventory/inventory.ini.old 
ssh -Y devstation
cd ansible-systems
git log
kubectl get nodes
kubectl create namespace oscore
rm -rf ~/.helm/
helm init --kube-context prodprox1
kubectl label node mcp3 kolla_compute=true
kubectl label node mcp2 kolla_compute=true
kubectl label node mcp1 kolla_compute=true
kubectl label node util1 kolla_conductor=true
cd
cd git/cisco/zen/
helm install ./helm/deploy/oscore-deployment --name oscore-deployment --values ./secrets.yml
kubectl get pods --all-namespaces
grep insecure ~/git/k8s/kargo/inventory/group_vars/all.yml 
kubectl get pods --all-namespaces
kubectl logs oscore-deploy-job-3hstx -n oscore -f
ssh -Y devstation 
top
