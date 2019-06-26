# bekkerstacks: traefik
Traefik Stack for Docker Swarm with SSL

## Requirement:

If you don't have swarm enabled, you can setup swarm with [docker in docker](https://github.com/bekkerstacks/docker-swarm)

## Usage for HTTPS:

Deploy Traefik in HTTPS. Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com
$ export MD5HASH=james:\$apr1\$qiEFTkWS\$w8skQfSLNHBxtyCLYp7mX1

$ docker stack deploy -c docker-compose.yml proxy
Creating network proxy
Creating service proxy_traefik
```

## Usage for HTTP:

Deploy Traefik in HTTP only. Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com
$ export MD5HASH=james:\$apr1\$qiEFTkWS\$w8skQfSLNHBxtyCLYp7mX1

$ docker stack deploy -c docker-compose_http.yml proxy
Creating network proxy
Creating service proxy_traefik
```

## Configuration

Stack takes the following environment variables:

- EMAIL=user@domain.com (email for acme)
- DOMAIN=yourdomain.com (base domain)
- MD5HASH=yourname:hash (defaults to admin/admin, use [#pre-requirements](#pre-requirements) to generate hash)

See [docker-compose_http.yml](docker-compose_http.yml) if you are interested in a **HTTP only proxy**.

## Basic Auth for Dashboard:

```
```

## Exposed Endpoints:

Traefik's dashboard should be available on `https://traefik.${DOMAIN}`

## Create a Sample App with Traefik

SSL Termination for a Ghost blog using Traefik:

```
$ docker stack deploy -c samples/docker-compose.sample-https-app.yml apps
Creating service apps_blog
```

Application should be exposed on `www.${DOMAIN}` and `${DOMAIN}`
