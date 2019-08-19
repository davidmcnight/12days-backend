defmodule TwelveDaysApi.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :event_name, :string
    field :start_time, :naive_datetime
    field :end_time, :naive_datetime
    field :send_ecard, :boolean, default: false
    field :all_day, :boolean, default: false

    has_one :event_occurrence, TwelveDaysApi.Events.EventOccurrence

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:event_name, :start_time, :end_time, :send_ecard, :all_day])
    |> validate_required([:event_name, :start_time, :end_time, :send_ecard, :all_day])
  end
end
