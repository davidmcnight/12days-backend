defmodule TwelveDaysApi.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @cast_attrs ~w(
    creator_id
    event_name
    start_time
    end_time
    send_ecard
    all_day
    start_date
    end_date
    increment
    increment_type
    interval
    days_of_week
    months_of_year
  )a

  schema "events" do
    field :event_name, :string, null: false
    field :start_time, :naive_datetime
    field :end_time, :naive_datetime
    field :send_ecard, :boolean, default: false
    field :all_day, :boolean, default: false
    field :start_date, :date
    field :end_date, :date
    field :increment, :integer
    field :increment_type, :string
    field :interval, :integer
    field :days_of_week, :string
    field :months_of_year, :string

    belongs_to :user, TwelveDaysApi.Users.User, [foreign_key: :creator_id]

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, @cast_attrs)
    |> validate_required([:event_name, :start_time, :end_time, :send_ecard, :all_day])
  end
end
