#!/usr/bin/env bash
MODE=${MODE-https}

if [ ${MODE} == "http" ] 
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
