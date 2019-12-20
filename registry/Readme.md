# Docker image registry

This is to run the [Docker Registry](https://docs.docker.com/registry/) across the cluster.  You have to create a swarm config before running to customise the registry the way we want it (ie, runs on localhost:5000, uses Minio as the shared storage back-end).
```bash
docker config create registry_config your_registry_config.yml
```
The you can deploy the stack :
```
docker stack deploy -c registry.yml registry
```
