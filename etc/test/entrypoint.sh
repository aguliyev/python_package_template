#!/bin/sh

isort . && \
black --extend-exclude=docs . && \
mypy python_package_template && \
flake8 python_package_template tests && \
coverage run -m pytest && \
coverage report --show-missing --skip-covered --fail-under=100
if [ $COVERAGE_REPORT ]; then
    coverage xml
    coverage json
    coverage html
fi
