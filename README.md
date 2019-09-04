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
- [Basic Auth for Traefik UI](https://github.com/bekkerstacks/traefik/wiki/Basic-Auth-for-Dashboard)
- [Deploy Traefik without the Deploy Script](https://github.com/bekkerstacks/traefik/wiki/Deploy-Traefik-without-the-Deploy-Script)

Deploy a Sample Application:
- [Create a Sample Application with Traefik](https://github.com/bekkerstacks/traefik/wiki/Create-a-Sample-App-with-Traefik)
