all: init-buildx publish

publish:
	bash publish.sh
init-buildx: clean-buildx
	docker buildx create --name mybuilder
	docker buildx use mybuilder
	docker buildx inspect --bootstrap
	docker buildx ls
clean-buildx:
	docker buildx rm mybuilder;true

