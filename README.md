# python_package_template

- Testing
- Typing, linting, formatting etc
- Dockerization
- Dependency management
- Environment variables passing to containers

Make commands:

    make build

    make test

    make coverage

    make publish

You can also play with your package in Jupyter notebook:

    make jupyter

Notebooks UI: http://127.0.0.1:8888/lab/tree/work?token=123 (the token is set in environment variable)

also, you can shell into the running container:

    make shell
