#!/usr/bin/env bash
EMAIL=${EMAIL}
DOMAIN=${DOMAIN-localhost}
PROTOCOL=${PROTOCOL-https}

# ask user for user/pass
read -p 'Username for Traefik UI: ' traefik_user
read -sp 'Password for Traefik UI: ' traefik_pass
printf "${traefik_user}:$(openssl passwd -apr1 ${traefik_pass})\n" > ./htpasswd

if [ ${PROTOCOL} == "http" ] 
  then
    echo "deploying traefik stack in http mode"
    docker stack deploy -c docker-compose_http.yml proxy
    echo "Traefik UI is available at:"
    echo "- http://traefik.${DOMAIN}"
  else
    echo "deploying traefik stack in https mode"
    docker stack deploy -c docker-compose.yml proxy
    echo "Traefik UI is available at:"
    echo "- https://traefik.${DOMAIN}"
fi
