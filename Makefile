.PHONY: build run

REPO  ?= kylefoxaustin/imx_install_bsp
TAG   ?= latest

build:
	docker build -t $(REPO):$(TAG) --build-arg localbuild=1 .

run:
	docker run \
		-i \
		-v ~/media/kyle/1tb/linuxdata/imx8development/junkdock/imxpoky:/root/poky \
--name imx8-yocto-build-test \
		$(REPO):$(TAG)

shell:
	docker exec -it imx8-yocto-build-test bash

