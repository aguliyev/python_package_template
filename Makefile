.PHONY: devsetup
devsetup:
	cp git_hooks/pre-push .git/hooks/pre-push

.PHONY: venv
venv:
	. etc/dev/.env && \
	. ./venv/bin/activate && \
	pip install $$PIP_PARAMS -r requirements.txt

.PHONY: build
build:
	docker compose --env-file ./etc/dev/.env build
	docker compose --env-file ./etc/dev/.env -v run --rm python_package_template

.PHONY: test
test:
	docker compose --env-file ./etc/test/.env run --rm python_package_template

.PHONY: coverage
coverage:
	docker compose --env-file ./etc/test/.env -e COVERAGE_REPORT=1 run --rm python_package_template

.PHONY: publish
publish:
	echo "TODO publish to pypi, artifact repo"

.PHONY: jupyter
jupyter:
	docker compose --env-file ./etc/dev/.env up -d python_package_template_jupyter

.PHONY: shell
shell:
	docker exec -it python_package_template bash

.PHONY: stop
stop:
	docker compose --env-file ./etc/dev/.env stop
