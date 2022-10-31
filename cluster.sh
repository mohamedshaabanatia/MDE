####Install Master node
bash <(curl -s https://raw.githubusercontent.com/mohamedshaabanatia/MDE/master/cluster-setup/install_master.sh)
###Kubectl Cheat sheet
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
alias k=kubectl
complete -o default -F __start_kubectl k
###Setup Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
