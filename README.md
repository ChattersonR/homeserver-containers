These compose files are using the `docker compose` built in to the docker cli.
https://docs.docker.com/compose/install/

This is using tailscale sidecar containers to directly expose containers to a tailscale tailnet.
https://tailscale.com/blog/docker-tailscale-guide

Copy `env.template` to `.env` and fill out missing information.

docker-compose.yaml should start all containers.

I also needed to install gnupg2 and pass because reasons. Why is docker cli tied to freedesktop stuff?
