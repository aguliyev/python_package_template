import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()
setuptools.setup(
    name='python_package_template',
    version='0.0.1',
    scripts=[],
    author="Anar Guliyev",
    author_email="anar@trialspark.com",
    license='Trialspark.com, Proprietary License',
    description="A template for package packages",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/trialspark/python_package_template ",
    packages=setuptools.find_packages(),
    install_requires=[
    ],
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: Other/Proprietary License',
        'Operating System :: OS Independent',
    ],
)
