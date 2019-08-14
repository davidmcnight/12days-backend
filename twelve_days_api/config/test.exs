use Mix.Config

# Configure your database
config :twelve_days_api, TwelveDaysApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "twelve_days_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :twelve_days_api, TwelveDaysApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
