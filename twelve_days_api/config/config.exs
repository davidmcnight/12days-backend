# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :twelve_days_api,
  ecto_repos: [TwelveDaysApi.Repo]

# Configures the endpoint
config :twelve_days_api, TwelveDaysApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K5Wlvqks3igtY6nF59GDfg7Ad3Wi9qFk9PUtJsJXGAQe5LzayJlJDvUMBpGZZ7JV",
  render_errors: [view: TwelveDaysApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TwelveDaysApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
