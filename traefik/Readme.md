# Traefik reverse proxy

[Traefik](https://containo.us/traefik/) is a reverse proxy that works natively with Docker and Kubernetes.  It can listen to events from either system and forward traffic to the right
containers based on labels attached to the services.

## Running this stack

First we need to create an overlay network called 'proxy' :
```bash
docker network create --driver=overlay proxy
```
Create a volume to store our letsencrypt certs :
```bash
docker volume create letsencrypt
```
Then set a couple of environment variables :
```bash
export TRAEFIK_DASHBOARD_HOST=traefik.yourdomain.com
export LETS_ENCRYPT_EMAIL=you@yourdomain.com
export ADMIN_CREDENTIALS=`echo $(htpasswd -nb username password) | sed -e s/\\$/\\$\\$/g`
```
Then deploy the stack :
```bash
docker stack deploy -c traefik-standalone.yml traefik
```
After a few moments you should be able to visit your TRAEFIK_DASHBOARD_HOST in the browser to see traefik's default dashboard and log in using the username & password you supplied to the ADMIN_CREDENTIALS htpasswd line.
