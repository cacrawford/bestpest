use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bestpest, Bestpest.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bestpest, Bestpest.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "bobsbest",
  password: "",
  database: "bestpest_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
