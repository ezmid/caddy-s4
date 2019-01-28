#!/usr/bin/make -f

# RUN WHOLE PROCESS IN ONE SHELL
.ONESHELL:

################################################################################
# Colors
################################################################################
# Are we running in an interactive shell? If so then we can use codes for
# a colored output
ifeq ("$(shell [ -t 0 ] && echo yes)","yes")
FORMAT_BOLD=\e[1m
FORMAT_RED=\033[0;31m
FORMAT_YELLOW=\033[0;33m
FORMAT_GREEN=\x1b[32;01m
FORMAT_RESET=\033[0m
else
FORMAT_BOLD=
FORMAT_RED=
FORMAT_YELLOW=
FORMAT_GREEN=
FORMAT_RESET=
endif

# Echo binary
ECHO=$(shell which echo)

################################################################################
# Specific project variables
################################################################################
REGISTRY=
NAMESPACE=ezmid
IMAGE=caddy-s4
TAG=latest
FULL_IMAGE_NAME=$(NAMESPACE)/${IMAGE}

################################################################################
# Manual
.ONESHELL: default
.PHONY: default
default: 
	@$(ECHO) -e "\n$(FORMAT_BOLD)VINTAGE MAKE TOOL$(FORMAT_RESET)\n" \
	"\n" \
	"$(FORMAT_YELLOW)Variables:$(FORMAT_RESET)\n" \
	"  REGISTRY:                    $(REGISTRY)\n" \
	"  NAMESPACE:                   $(NAMESPACE)\n" \
	"  IMAGE:                       $(IMAGE)\n" \
	"  TAG:                         $(TAG)\n" \
	"\n" \
	"$(FORMAT_YELLOW)Commands:$(FORMAT_RESET)\n" \
	"  make build                   Build the image\n" \
	"  make build TAG=1.1.0         Build a specific version of the image\n" \
	"  make test                    Test the image with Goss\n" \
	"  make test TAG=1.1.0          Test a specific version of the image with Goss\n" \
	"  make push                    Push the image to the registry\n" \
	"  make push TAG=1.1.0          Push a specific version of the image to the registry\n" \
	"\n"

################################################################################
# Build/rebuild the image
.PHONY: build
.ONESHELL: build
build:
	docker build . -t $(FULL_IMAGE_NAME):$(TAG)

################################################################################
# Push the image to registry
.PHONY: push
.ONESHELL: push
push:
	docker push $(FULL_IMAGE_NAME):$(TAG)

################################################################################
# Run a test
.PHONY: test
.ONESHELL: test
test:
	@dgoss run $(FULL_IMAGE_NAME):$(TAG)