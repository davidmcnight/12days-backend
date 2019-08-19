defmodule TwelveDaysApi.Events.EventOccurrence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "event_occurrences" do
    field :start_date, :date
    field :end_date, :date
    field :increment, :integer
    field :increment_type, :string
    field :interval, :integer
    field :days_of_week, :string
    field :months_of_year, :string

    belongs_to :event, TwelveDaysApi.Events.Event

    timestamps()
  end

  @doc false
  def changeset(event_occurrence, attrs) do
    event_occurrence
    |> cast(attrs, [:start_date, :end_date, :increment, :increment_type, :interval, :days_of_week, :months_of_year])
    |> validate_required([:start_date, :end_date, :increment, :increment_type, :interval, :days_of_week, :months_of_year])
  end
end
