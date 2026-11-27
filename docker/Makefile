IMAGE_NAME ?= sequoia

.PHONY: build run clean delete-images

build:
	@echo "Building Docker image $(IMAGE_NAME) for Sequoia x86 RT 5 (ARM64)..."
	docker buildx build --platform linux/arm64 --load --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) -t $(IMAGE_NAME) .

run:
	# No --gpus flag: Intel x86 RT 5 has no CUDA-capable GPU
	docker run -it --rm --hostname "Intel x86 RT 5" $(IMAGE_NAME)

clean:
	docker rmi $(IMAGE_NAME) || true

delete-images:
	docker rmi $(docker images -q) || true
