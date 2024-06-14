ENV_FILE := .env
ENV = $(shell grep -v "^\#" $(ENV_FILE))
include .env

migrate:
	migrate -path ./migrations -database "mysql://$(USER):$(PASSWORD)@tcp(localhost:3306)/$(DATABASE)?multiStatements=true" up

migrate-down:
	migrate -path ./migrations -database "mysql://$(USER):$(PASSWORD)@tcp(localhost:3306)/$(DATABASE)?multiStatements=true" down

gen-migrate:
	migrate create -ext sql -dir ./migrations -seq $(name)

# gcloud auth loginを実行ずみであること
# gcloud set project PROJECT_IDを実行ずみであること
setup-proxy:
	curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.1.2/cloud-sql-proxy.darwin.amd64
	chmod 744 cloud-sql-proxy
	gcloud components install cloud_sql_proxy --quiet
	rm cloud-sql-proxy

cloud-sql-proxy:
	cloud_sql_proxy -instances=$(SQL_INSTANCE)=tcp:0.0.0.0:3306 -credential_file=key.json