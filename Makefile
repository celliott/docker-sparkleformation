# docker-aws makefile

PORTS = -p 80:5000
ENVS = -e ADMIN_USER=${ADMIN_USER} -e ADMIN_PASS=${ADMIN_PASS} -e ADMIN_EMAIL=${ADMIN_EMAIL} -e MODULE=${MODULE}

VOLUMES = -v ~/:/root
CONTAINER = aws

.PHONY: container run

container :
	docker build -t $(CONTAINER) .

run :
	docker run --restart=always --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)

kill :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)

restart :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
	docker run --restart=always --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)

attach:
	docker attach $(CONTAINER)

bash:
	docker exec -ti $(CONTAINER) /bin/bash

tail:
	docker logs -f $(CONTAINER)