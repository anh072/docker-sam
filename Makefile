SAM_CLI_VERSION = 1.15.0
IMAGE_NAME ?= anhnguyen072/sam-cli:$(SAM_CLI_VERSION)
TAG = $(SAM_CLI_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

test:
	@docker run --rm -it $(IMAGE_NAME) sam --version

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(shell pwd):/opt/app $(IMAGE_NAME) bash

push:
	docker push $(IMAGE_NAME)

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)