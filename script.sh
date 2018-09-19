aws ec2 run-instances --image-id ami-3448784b \
--count 1 --instance-type t3.medium \
--key-name mudryy \
--security-group-ids sg-7c1a6206 \
--subnet-id subnet-3728cf7e \
--tag-specifications \
'ResourceType=instance,Tags=[{Key=Owner,Value=OLP_Delivery_Systems_Engineering},{Key=Name,Value=K8S Pod},{Key=Project,Value=I_EXT_OLPD_ADMINS},{Key=Team,Value=OLP Delivery},{Key=createdBy,Value=mudryy}]' \
--dry-run

kubeadm init --token=102952.1a7dd4cc8d1f4cc5 --kubernetes-version $(kubeadm version -o short)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
