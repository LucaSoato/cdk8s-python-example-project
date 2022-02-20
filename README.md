# Cdk8s Python Example Project

Keeping up with the increasing burden of dependency management is not always easy. Docker is a beautiful technology that helped to address that specific problem. This repository proposes its usage for the development environment of Cdk8s, specifically the python API version.

## Why
These are the reasons that pushed in favor of simplifying the cdk8s environment:
- Managing Node and its version is not that easy for newcomers (the number of the different package managers and node managers is itself a confusing factor)
- Managing Python is not hard, but the fact that a specific python environment needs to exchange commands with node increases its difficulty

The Cdk8s project is fascinating, and the simplification proposed should soften up its learning curve.

## Implemented Strategies

### Makefile

All the development commands (build and synth) are encoded into a Makefile.

### `setup.py` and package

The project is already formatted as a package, following the user experience of AWS CDK. In this way, code reuse is also possible.

### Dockerfile

All the development dependencies are already solved and managed in the Dockerfile.

### .gitignore and imports

The `imports` directory should not be kept inside the project, it would be too long to parse, and when sharing projects, no one would have the time to inspect it exhaustively. Generating the `imports` directory from scratch, including it in the .gitignore file, and specifying the versions in the `cdk8s.yaml` should ease the overall experience.

## Caveat

### OS

The whole project has been tested on Linux Mint only. Docker usage should allow even easier portability, but if you encounter any problem, please, open an issue.

### Multi-stage builds?

The Dockerfile seems a bit too long for this reason: it is necessary to have both Node and Python installed.
It starts from a clean `node:17-buster` image and follows all the steps to recreate the `python:3.9-buster` image.
If you know any better way to do this, please, open a PR.
