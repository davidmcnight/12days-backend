defmodule TwelveDaysApi.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :latest_activity, :naive_datetime
      add :password_hash, :string, null: false
      timestamps()
    end
    create unique_index(:users, [:email])


  end
end
