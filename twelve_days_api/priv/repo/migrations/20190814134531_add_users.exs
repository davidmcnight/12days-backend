defmodule TwelveDaysApi.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    add :active, :boolean
    add :email, :string, null: false
    add :first_name, :string
    add :last_name, :string
    add :date_of_birth, :date
    add :latest_activity, :naive_datetime
    add :password_hash, :string
    timestamps()
  end
end
