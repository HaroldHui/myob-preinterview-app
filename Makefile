.PHONY: build package deploy-%

export LAST_COMMIT_SHA := $(shell git rev-parse HEAD)
export VERSION := 1.0


test:

build:
	@./scripts/build.sh

package: ecr-login
	@./scripts/push_image.sh
