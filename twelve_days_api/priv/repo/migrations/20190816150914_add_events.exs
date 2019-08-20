defmodule TwelveDaysApi.Repo.Migrations.AddEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :event_name, :string, null: false
      add :start_time, :naive_datetime, null: false
      add :end_time, :naive_datetime
      add :creator_id, references(:users, on_delete: :delete_all)
      add :send_ecard, :boolean, default: false
      add :all_day, :boolean, default: false
      add :start_date, :date
      add :end_date, :date
      add :increment, :integer
      add :increment_type, :string
      add :interval, :integer
      add :days_of_week, :string
      add :months_of_year, :string
      timestamps()
    end
    create index(:events, [:creator_id])
  end
end
