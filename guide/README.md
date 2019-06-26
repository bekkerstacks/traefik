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
