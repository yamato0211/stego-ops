helm upgrade -i piped oci://ghcr.io/pipe-cd/chart/piped --version=v0.47.2 --namespace=pipecd --values secrets.yaml \
  --set-file config.data=values.yaml \
  --set-file secret.data.piped-key=pipekey
