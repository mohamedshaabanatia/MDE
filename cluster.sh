####Install Master node
bash <(curl -s https://raw.githubusercontent.com/mohamedshaabanatia/MDE/master/cluster-setup/install_master.sh)

###Setup Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

###Kubectl Cheat sheet
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
alias k=kubectl
complete -o default -F __start_kubectl k

###remove taint
kubectl taint nodes $(kubectl get nodes --no-headers) node-role.kubernetes.io/control-plane:NoSchedule-
kubectl taint nodes $(kubectl get nodes --no-headers) node-role.kubernetes.io/master:NoSchedule-

###Deploy Argo ( How to modify server inseceure )
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

###Argo CD
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

###Nginx Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/baremetal/deploy.yaml

##Configure Argo access
kubectl apply -f https://raw.githubusercontent.com/mohamedshaabanatia/MDE/master/gRPC-ingress.yaml
kubectl apply -f https://raw.githubusercontent.com/mohamedshaabanatia/MDE/master/http-ingress.yaml
