# bekkerstacks: traefik
Traefik Stack for Docker Swarm with SSL

## Usage:

Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com
$ export MD5HASH=james:\$apr1\$qiEFTkWS\$w8skQfSLNHBxtyCLYp7mX1

$ docker stack deploy -c docker-compose.yml proxy
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

Create a MD5 username/password string:

```
$ echo "james:$(openssl passwd -apr1 password)"
james:$apr1$qiEFTkWS$w8skQfSLNHBxtyCLYp7mX1
```

To generate a string compatible for docker compose, we need to escape the `$` symbols:

```
$ echo "james:$(openssl passwd -apr1 password)" | sed -e s/\\$/\\$\\$/g
james:$$apr1$$pLHI5lWL$$grJXKdQ0ppAoHOV712k5p1

- "traefik.frontend.auth.basic=james:$$apr1$$pLHI5lWL$$grJXKdQ0ppAoHOV712k5p1"
```

To expose the string to n environment variable, we need to escape the the `$` with `\`:

```
$ export MYHASH=james:\$apr1\$qiEFTkWS\$w8skQfSLNHBxtyCLYp7mX1

- "traefik.frontend.auth.basic=${MYHASH}"
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
