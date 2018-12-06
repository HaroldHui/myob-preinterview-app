.PHONY: cleanup test package

export LAST_COMMIT_SHA := $(shell git rev-parse HEAD)
export VERSION := 1.0
export COMMIT := $(shell git rev-parse --short HEAD)
export APP_NAME := myob-pre-interview

cleanup:
	@./scripts/cleanup.sh

test:
	@./scripts/test.sh

package:
	@./scripts/package.sh
