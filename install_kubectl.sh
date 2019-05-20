# install.sh
#!/bin/sh

# Install kubernetes and set config
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
mkdir ${HOME}/.kube
cp k3s.yaml ${HOME}/.kube/config

# Fill out missing params in kubectl config file
kubectl config set clusters.default.server "$KUBE_SERVER"
kubectl config set users.default.username "$KUBE_USERNAME"
kubectl config set users.default.password "$KUBE_PASSWORD"
kubectl config set clusters.default.certificate-authority-data "$KUBE_CERT" --set-raw-bytes=false
