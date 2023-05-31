# python_package_template

- Testing
- Typing, linting, formatting etc
- Dockerization
- Dependency management
- Environment variables passing to containers

Make commands:

## Setup:

    make devsetup

Pycharm will create `./venv`.
So, you can also install everything for the interpreter Pycharm uses:

    make venv

## Build and test:

    make build

    make test

    make coverage

    make publish

## Jupyter notebook

You can also play with your package in Jupyter notebook:

    make jupyter

    make stop

Notebooks UI: http://127.0.0.1:8888/lab/tree/work?token=123 (the token is set in environment variable)

also, you can shell into the running container:

    make shell
