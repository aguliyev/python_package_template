.PHONY: build
build:
	docker build -t python_package_template .
	rm -rf dist
	docker run -v `pwd`:/app python_package_template

.PHONY: test
test:
	docker run -v `pwd`:/app -it translucent /bin/sh -c "isort --check . ; black --extend-exclude=docs . ; mypy translucent ; flake8 python_package_template tests ; pytest "

.PHONY: publish
publish:
	echo "TODO publish to pypi, artifact repo"

.PHONY: jupyter
jupyter:
	docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes \
	    --name python_package_template_jupyter \
	    -v "$(shell pwd)/docs/notebooks":/home/jovyan/work \
	    -v "$(shell pwd)":/home/jovyan/python_package_template \
	    jupyter/datascience-notebook

.PHONY: shell
shell:
	docker exec -it python_package_template_jupyter bash
