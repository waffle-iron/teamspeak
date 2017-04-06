NAME=teamspeak
VERSION=3.0.13.4

build:
	docker build -t ${NAME}:${VERSION} .

shell: build
	docker run -it --rm  ${NAME}:${VERSION} sh

release:
	docker build -t asosgaming/${NAME}:${VERSION} .
	docker push asosgaming/${NAME}:${VERSION}

test: build
	docker run  --rm -it -p "9987:9987/udp" ${NAME}:${VERSION}
