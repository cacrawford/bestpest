# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bestpest,
  ecto_repos: [Bestpest.Repo]

# Configures the endpoint
config :bestpest, Bestpest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B4Uj66Vt6zJVnmiJl3cSijllCaMSK9A3l7e9Zrl4E2qJ+GXkut7Lgu9HyEuG4xZR",
  render_errors: [view: Bestpest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bestpest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :addict,
  secret_key: "243262243132244f487261504974496a67436b332f4a39457379493965",
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: Bestpest.User,
  repo: Bestpest.Repo,
  from_email: "no-reply@example.com", # CHANGE THIS
  mailgun_domain: "https://api.mailgun.net/v3/",
  mailgun_key: "",
  mail_service: :mailgun
