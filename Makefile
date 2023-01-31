.PHONY: build
build:
	docker build -t python_package_template .
	docker run --env-file ./etc/dev/.env -v `pwd`:/app python_package_template

.PHONY: test
test:
	docker run --env-file ./etc/test/.env -v `pwd`:/app -it python_package_template

.PHONY: coverage
coverage:
	docker run --env-file ./etc/test/.env -e COVERAGE_REPORT=1 -v `pwd`:/app -it python_package_template

.PHONY: publish
publish:
	echo "TODO publish to pypi, artifact repo"

.PHONY: jupyter
jupyter:
	docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -e JUPYTER_TOKEN=123 \
	    --name python_package_template_jupyter \
	    -v "$(shell pwd)/docs/notebooks":/home/jovyan/work \
	    -v "$(shell pwd)":/home/jovyan/python_package_template \
	    jupyter/datascience-notebook

.PHONY: shell
shell:
	docker exec -it python_package_template_jupyter bash
