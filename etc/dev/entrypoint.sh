#!/bin/sh

echo "Building python package"
rm -rf dist
python -m build
