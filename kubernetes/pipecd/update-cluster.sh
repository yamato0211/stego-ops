helm upgrade -i pipecd oci://ghcr.io/pipe-cd/chart/pipecd --version v0.47.2 --namespace=pipecd --create-namespace --values values.yaml \
  --set-file config.data=secret.yaml \
  --set-file secret.encryptionKey.data=encryption-key \
  --set-file secret.firestoreServiceAccount.data=firestore.json \
  --set-file secret.gcsServiceAccount.data=cloudstorage.json