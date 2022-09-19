.PHONY: pg.up
pg.up: ## postgres起動
	docker-compose up pg pg-web

.PHONY: pg.dump
pg.dump: ## 現在のpostgresの状態をdump
	docker-compose exec pg bash -c 'pg_dump dummy-db --inserts -a -Udummy-user > /docker-entrypoint-initdb.d/9001-pg-dump.sql'

.PHONY: down
down: ## docker-compose down
	docker-compose down

.PHONY: fmt
fmt: ## format
	echo fmt

################################################################################
# Utility-Command help
################################################################################
.DEFAULT_GOAL := help

################################################################################
# マクロ
################################################################################
# Makefileの中身を抽出してhelpとして1行で出す
# $(1): Makefile名
define help
  grep -E '^[\.a-zA-Z0-9_-]+:.*?## .*$$' $(1) \
  | grep --invert-match "## non-help" \
  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
endef

################################################################################
# タスク
################################################################################
.PHONY: help
help: ## Make タスク一覧
	@echo '######################################################################'
	@echo '# Makeタスク一覧'
	@echo '# $$ make XXX'
	@echo '# or'
	@echo '# $$ make XXX --dry-run'
	@echo '######################################################################'
	@echo $(MAKEFILE_LIST) \
	| tr ' ' '\n' \
	| xargs -I {included-makefile} $(call help,{included-makefile})
