import setuptools

with open("README.md") as fp:
    long_description = fp.read()

setuptools.setup(
    name="myexamplechart",
    version="0.0.1",

    description="An example Cdk8s Python stack",
    long_description=long_description,
    long_description_content_type="text/markdown",

    author="Luca Soato",

    package_dir={"": "myexamplechart"},
    packages=setuptools.find_packages(where="myexamplechart"),

    install_requires=[
        "constructs ~= 3.3.202",  # TODO: Check they right constructs version
        "cdk8s==2.2.21",

        # TODO: Check if this package should be explicited here, even if it's not in pip
        "cdk8s-plus-22 ~=1.0.0.b102",

    ],

    python_requires=">=3.9",

    classifiers=[

        "Intended Audience :: Developers",

        "Programming Language :: JavaScript",
        "Programming Language :: Python :: 3 :: Only",
        "Programming Language :: Python :: 3.9",

        "Topic :: Software Development :: Code Generators",
        "Topic :: Utilities",

        "Typing :: Typed",
    ],
)
