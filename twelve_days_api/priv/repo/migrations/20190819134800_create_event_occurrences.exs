defmodule TwelveDaysApi.Repo.Migrations.CreateEventOccurrences do
  use Ecto.Migration

  def change do
    create table(:event_occurrences) do
      add :start_date, :date
      add :end_date, :date
      add :increment, :integer
      add :increment_type, :string
      add :interval, :integer
      add :days_of_week, :string
      add :months_of_year, :string

      timestamps()
    end

  end
end
