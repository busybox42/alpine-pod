IMAGE=alpine-pod

.PHONY: all build

all: build

build:
	docker build --network=host --rm -t $(IMAGE) .
