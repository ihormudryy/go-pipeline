aws ec2 run-instances --image-id ami-3448784b \
--count 1 --instance-type t3.medium \
--key-name mudryy \
--security-group-ids sg-7c1a6206 \
--subnet-id subnet-3728cf7e \
--tag-specifications \
'ResourceType=string,Tags=[{Key=Name,Value=K8S Pod}]' \
'ResourceType=string,Tags=[{Key=Project,Value=I_EXT_OLPD_ADMINS}]' \
'ResourceType=string,Tags=[{Key=Team,Value=OLP Delivery}]' \
'ResourceType=string,Tags=[{Key=createdBy,Value=mudryy}]' \
'ResourceType=string,Tags=[{Key=Owner,Value=OLP_Delivery_Systems_Engineering}]'

kubeadm init --token=102952.1a7dd4cc8d1f4cc5 --kubernetes-version $(kubeadm version -o short)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
