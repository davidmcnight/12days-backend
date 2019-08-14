defmodule TwelveDaysApi.Repo do
  use Ecto.Repo,
    otp_app: :twelve_days_api,
    adapter: Ecto.Adapters.Postgres
end
