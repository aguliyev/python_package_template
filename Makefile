.PHONY: build
build:
	docker build -t python_package_template .
	rm -rf dist
	docker run -v `pwd`:/app python_package_template

.PHONY: test
test:
	docker run -v `pwd`:/app -it python_package_template pytest

.PHONY: publish
publish:
	echo "TODO publish to pypi, artifact repo"

.PHONY: jupyter
jupyter:
	docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes \
	    --name python_package_template_jupyter \
	    -v "$(shell pwd)/docs":/home/jovyan/work \
	    -v "$(shell pwd)":/home/jovyan/python_package_template \
	    jupyter/datascience-notebook

.PHONY: shell
shell:
	docker exec -it python_package_template_jupyter bash
