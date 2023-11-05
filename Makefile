IMAGE=yaml2ics
BASE=ruby:alpine

.PHONY: build update test clean all

all: clean build

clean:
	-docker image rm $(IMAGE)

build:
	docker build -t $(IMAGE) .

update:
	docker pull $(BASE)
	docker run --rm --volume $(PWD):/app --workdir /app $(BASE) bundle update

ics:
	docker run --rm --volume $(PWD)/yaml/:/data/ $(IMAGE) yaml2ics *.yaml > calendar.ics
