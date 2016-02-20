# docker-sparkle makefile

CONTAINER = sparkle
VOLUMES = -v ~/:/root -v sparkle:/sparkle

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
