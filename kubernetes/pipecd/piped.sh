helm upgrade -i prd-piped oci://ghcr.io/pipe-cd/chart/piped --version=v0.47.2 --namespace=pipecd \
  --set-file config.data=piped.yaml \
  --set-file secret.data.piped-key=pipekey \
  --set-file secret.data.ssh-key=sshkey
