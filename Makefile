.PHONY: static-check test build

export LAST_COMMIT_SHA := $(shell git rev-parse HEAD)
export VERSION := 1.0
export COMMIT := $(shell git rev-parse --short HEAD)
export APP_NAME := myyob-api

static-check:
	@./scripts/static_check.sh

test:
	@./scripts/test.sh

build: ecr-login
	@./scripts/build.sh
