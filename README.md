# Bestpest

Set up on your machine:

* Install [Docker CE](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install/)
* Start the `jwilder/nginx-proxy` container: (only needs to be done once)

        docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro --restart always jwilder/nginx-proxy

* Add `127.0.0.1     bobsbest.dev` to your `/etc/hosts` file
* Run `docker-compose up -d`
* Visit [bobsbest.dev](http://bobsbest.dev) to see if the connection succeeded.

## Further usage

To direct any `mix` commands to the app container, simply run

    ./mix <arguments...>

If you need to run any other commands (`npm`, etc) you can connect to
the container via shell with

    docker-compose exec app /bin/bash

Server logs can be accessed using

    docker-compose logs app

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
