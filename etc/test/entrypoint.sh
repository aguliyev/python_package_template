#!/bin/sh

isort .
black --extend-exclude=docs .
mypy python_package_template
flake8 python_package_template tests
pytest
