

## Tooling
- Using new `go tools`in GoLang 1.24: https://www.jvt.me/posts/2025/01/27/go-tools-124/
- OpenAPI Code Generation: https://github.com/oapi-codegen/oapi-codegen
- Migration tool: https://github.com/amacneil/dbmate
- Query builder: https://bun.uptrace.dev


## Start postgres

```shell
export MONOREPO_ROOT=../.. # This works if running from the database folder.
docker run --name palmira-pro-db-standalone \
  --rm \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -e POSTGRES_DB=palmira_pro_db \
  -p 3000:3000 \
  -d \
  postgres:17.4

docker logs palmira-pro-db-standalone -f
```

## Start API

```shell
export MONOREPO_ROOT=../.. # This works if running from the database folder.
docker run --name palmira-pro-api-standalone \
  --rm \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -e DB_CONNECTION=palmira_pro_db \
  -v $( OLDPWD=- CDPATH= cd -P -- "$MONOREPO_ROOT"/packages/db/schema && pwd ):/docker-entrypoint-initdb.d \
  -p 5432:5432 \
  -d postgres:17.4

docker logs palmira-pro-db-standalone -f
```