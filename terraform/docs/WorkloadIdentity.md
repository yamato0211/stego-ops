## Workload Identity
GithubActions用のOIDCトークンを利用する際の設定
こちらはIaC化しないためドキュメントとして残す

### サービスアカウントの作成
```
$ gcloud iam service-accounts create stego-github-actions
$ gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member="serviceAccount:stego-github-actions@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role="roles/editor"
```

### プールの作成
```
$ gcloud iam workload-identity-pools \
  create stego-github-actions \
  --location=global
```

### プロバイダの作成
```
$ gcloud iam workload-identity-pools providers create-oidc github-provider \
  --location=global \
  --workload-identity-pool=stego-github-actions \
  --issuer-uri=https://token.actions.githubusercontent.com \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.aud=assertion.aud,attribute.repository=assertion.repository"
```

### サービスアカウントの権限借用許可
```
$ gcloud iam service-accounts add-iam-policy-binding stego-github-actions@${PROJECT_ID}.iam.gserviceaccount.com \
    --role=roles/iam.workloadIdentityUser \
    --member="principalSet://iam.googleapis.com/projects/${PROJECT_NUM}/locations/global/workloadIdentityPools/stego-github-actions/*"
```