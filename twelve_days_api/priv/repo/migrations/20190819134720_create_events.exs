defmodule TwelveDaysApi.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :event_name, :string
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :send_ecard, :boolean, default: false, null: false
      add :all_day, :boolean, default: false, null: false

      timestamps()
    end

  end
end
