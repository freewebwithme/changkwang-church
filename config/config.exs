# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :changkwang,
  ecto_repos: [Changkwang.Repo]

# Configures the endpoint
config :changkwang, ChangkwangWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i0CqgwaumP3g1lMf3CsZL8qiecADWHICWnzLtPzRD4vKzWf58ES0o+SzY0D8FMBt",
  render_errors: [view: ChangkwangWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Changkwang.PubSub,
  live_view: [signing_salt: "bTNOw6dM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
