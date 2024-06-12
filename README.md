These compose files are using the `docker compose` built in to the docker cli.
https://docs.docker.com/compose/install/

I don't know if podman compose or the old docker-compose can read the same "compose v2" format.

This is using tailscale sidecar containers to directly expose containers to a tailscale tailnet.
https://tailscale.com/blog/docker-tailscale-guide

Copy `env.template` to `.env` and fill out missing information.

---

Why are there two TS_AUTHKEYS?

I wanted to play around with having "guests" in the tailnet that could access a specific subset
of containers, so I made two tags: `tag:container` and `tag:shared`. `tag:container` can only
talk to other things with `tag:container`, in an attempt to limit or prevent hostile egress from
the container services to bare metal machines. Guests in the tailnet can only see hosts with `tag:shared`.

For some reason, an OAuthClient with permissions to write `tag:container` and `tag:shared` was not able to
authenticate containers with *only* `tag:container`. le shrug.

```
"tagOwners": {
    "tag:container": ["autogroup:admin"],
    "tag:shared":    ["tag:container"],
},
```
(I also couldn't get two things owned by autogroup:admin. Don't understand that yet either).

---

Why is everything in one .env file? 

It would seem there isn't a non-obnoxious way to deal with split split environments.
I could put everything into their own directories and have a .env per compose group, but then
I lose global things like TS_AUTHKEY, APPDATA_PATH, PUID, PGID, and TZ. env_files passed into the service arn't read
the same way as the .env; they go straight to the container environment instead of being usable for
compose file substitution. 

---

I also needed to install gnupg2 and pass because reasons. Why is docker cli tied to freedesktop authenticator apis?
