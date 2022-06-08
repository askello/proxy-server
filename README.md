# proxy-server

Dockerized proxy server, based on [Alpine linux](https://www.alpinelinux.org/)
and [tinyproxy](https://tinyproxy.github.io/).

By default, connection is allowed from anyone/everywhere.

Access can be restricted:
- by using login/password (BasicAuth)
- by allowing only certain IPs (hosts)

## Usage

Build image:
```shell
docker build -t askello/proxy-server .
```

Start proxy server (without any restrictions, can be used by anyone):
```shell
docker run -it -p 8888:8888 askello/proxy-server
```

Start proxy server (access allowed with login/password only):
```shell
docker run -it -p 8888:8888 -e PROXY_AUTH_USER=user -e PROXY_AUTH_PASSWORD=12345 askello/proxy-server
```

Start proxy server (access allowed from certain hosts only):
```shell
docker run -it -p 8888:8888 -e PROXY_ALLOW_HOSTS=127.0.0.1,127.0.0.2 askello/proxy-server
```

Connect to running container:
```bash
docker exec -it ${container_name} sh
```

Show config:
```bash
docker exec -it ${container_name} less /etc/tinyproxy/tinyproxy.conf
```