# Bestpest

Set up on your machine:

  * Install elixir    https://elixir-lang.org/install.html
  * Install postgres  https://wiki.postgresql.org/wiki/Detailed_installation_guides
  * Create user on postgres: `createuser bobsbest`
  * Create dev DB on postgres:   `createdb bestpest_dev`
  * Create dev DB on postgres:   `createdb bestpest_test`
  * type `psql`
  * `psql> grant all privileges on database bobsbest_dev to bobsbest`
  * `psql> grant all privileges on database bobsbest_test to bobsbest`
  * `psql> \q` to exit
  * Create schema on both DBs called "bobsbest"
  * Set default schema for user bobsbest to "bobsbest"
  * Change to project folder
  * Get dependencies: `mix deps.get`
  * Create tables by calling `mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start server by running `mix phoenix.server`





Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
