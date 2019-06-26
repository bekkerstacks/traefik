# bekkerstacks: traefik
Traefik Stack for Docker Swarm with SSL

## Requirement:

If you don't have swarm enabled, you can setup swarm with [docker in docker](https://github.com/bekkerstacks/docker-swarm)

## Basic Auth for Dashboard:

The `htpasswd` file has the default admin/admin credentials, but to overwrite:

```
$ htpasswd -cB htpasswd admin
New password:
Re-type new password:
Adding password for user admin
```

Alternative options for basic auth is available in [guide](guide/README.md)

## Usage for HTTPS:

Deploy Traefik in HTTPS. Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com

$ docker stack deploy -c docker-compose.yml proxy
Creating network proxy
Creating service proxy_traefik
```

## Usage for HTTP:

Deploy Traefik in HTTP only. Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com

$ docker stack deploy -c docker-compose_http.yml proxy
Creating network proxy
Creating service proxy_traefik
```

## Configuration

Stack takes the following environment variables:

- EMAIL=user@domain.com (email for acme)
- DOMAIN=yourdomain.com (base domain)

See [docker-compose_http.yml](docker-compose_http.yml) if you are interested in a **HTTP only proxy**.

## Exposed Endpoints:

Traefik's dashboard should be available on `https://traefik.${DOMAIN}`

## Create a Sample App with Traefik

SSL Termination for a Ghost blog using Traefik:

```
$ docker stack deploy -c samples/docker-compose.sample-https-app.yml apps
Creating service apps_blog
```

Application should be exposed on `www.${DOMAIN}` and `${DOMAIN}`
