# This MakeFile comprehends all the logic to synthetize the kubernetes templates from your code

# These paths are calculated so that they can be used to identify the right project container

mkfile_path := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
current_dir:=$(shell cd $(shell dirname $(mkfile_path)); pwd)
project_name:=$(notdir $(current_dir))

.PHONY: help build push all

help:
	    @echo "Makefile arguments:"
	    @echo ""
	    @echo ""
	    @echo "Makefile commands:"
	    @echo "build"
	    @echo "synth"
	    @echo "all"

.DEFAULT_GOAL := all

build:
		@echo Building...
		@echo Project path: ${current_dir}
		@echo Project name: ${project_name}
		@docker build -t cdk8s-${project_name} .

		@echo Downloading the imports defined in cdk8s.yaml
		# Cdk8s import can be used to import CRDs in the project
		@docker run -it --entrypoint "npx" -u node -v ${current_dir}:/usr/src/app cdk8s-${project_name}:latest cdk8s import --language python

synth:
		docker run -it --entrypoint "npx" -u node --rm -v ${current_dir}:/usr/src/app cdk8s-${project_name}:latest cdk8s synth

all: build synth
