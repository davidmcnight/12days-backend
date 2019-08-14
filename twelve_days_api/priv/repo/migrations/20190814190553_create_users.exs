defmodule TwelveDaysApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :field, :string
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :password_hash, :string
      add :latest_activity, :naive_datetime

      timestamps()
    end

  end
end
