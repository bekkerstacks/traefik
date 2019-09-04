# bekkerstacks: traefik
Traefik Stack for Docker Swarm with SSL

## Requirement:

If you don't have swarm enabled, you can setup swarm with [docker in docker](https://github.com/bekkerstacks/docker-swarm)

## Usage

To deploy Traefik in HTTPS mode using the deploy script:

```
$ EMAIL=me@mydomain.com DOMAIN=mydomain.com PROTOCOL=https bash deploy.sh
Username for Traefik UI: ruan
Password for Traefik UI: deploying traefik stack in http mode
Creating network public
Creating config proxy_traefik_htpasswd
Creating service proxy_traefik
Traefik UI is available at:
- http://traefik.localhost
```

To deploy Traefik in HTTP mode using the deploy script:

```
$ DOMAIN=localhost PROTOCOL=http bash deploy.sh
Username for Traefik UI: ruan
Password for Traefik UI: deploying traefik stack in https mode
Creating network public
Creating config proxy_traefik_htpasswd
Creating service proxy_traefik
Traefik UI is available at:
- https://traefik.mydomain.com
```

## Documentation

Deploying Traefik with the deploy script:

- [Deploy Traefik in HTTP Mode](https://github.com/bekkerstacks/traefik/wiki/Deploy-Traefik-in-HTTP-Mode)
- [Deploy Traefik in HTTPS Mode](https://github.com/bekkerstacks/traefik/wiki/Deploy-Traefik-in-HTTPS-Mode)

Deploying Traefik without the deploy script:

## More Info

### Basic Auth for Dashboard:

The `htpasswd` file has the default admin/admin credentials, but to overwrite:

```
$ htpasswd -cB htpasswd admin
New password:
Re-type new password:
Adding password for user admin
```

Alternative options for basic auth is available in [guide](guide/README.md)

### Usage for HTTPS:

Deploy Traefik in HTTPS. Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com

$ docker stack deploy -c docker-compose.yml proxy
Creating network proxy
Creating service proxy_traefik
```

### Usage for HTTP:

Deploy Traefik in HTTP only. Define your environment variables and deploy the stack

```
$ export EMAIL=user@domain.com
$ export DOMAIN=mydomain.com

$ docker stack deploy -c docker-compose_http.yml proxy
Creating network proxy
Creating service proxy_traefik
```

### Configuration

Stack takes the following environment variables:

- EMAIL=user@domain.com (email for acme)
- DOMAIN=yourdomain.com (base domain)

See [docker-compose_http.yml](docker-compose_http.yml) if you are interested in a **HTTP only proxy**.

### Exposed Endpoints:

Traefik's dashboard should be available on `https://traefik.${DOMAIN}`

### Create a Sample App with Traefik

#### HTTP Endpoint:

To create a application for Traefik in HTTP Frontends:

```
$ docker stack deploy -c samples/docker-compose.sample-http-app.yml apps
Creating service apps_whoami
```

Application should be exposed on `whoami.${DOMAIN}`

```
$ curl http://whoami.${DOMAIN}
Hostname: ea75b484dbaf
```

#### HTTPS Endpoint:

If Traefik was setup with HTTPS, for SSL Termination on Traefik for the sample application:

```
$ docker stack deploy -c samples/docker-compose.sample-https-app.yml apps
Creating service apps_whoami
```

Application should be exposed on `whoami.${DOMAIN}`

```
$ curl http://whoami.${DOMAIN}
Hostname: ga39f420dgzo
```
