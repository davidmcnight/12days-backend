defmodule TwelveDaysApi.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :latest_activity, :naive_datetime
      add :password_hash, :string
      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
