defmodule TwelveDaysApiWeb.Api.EventView do
  use TwelveDaysApiWeb, :view
  alias TwelveDaysApiWeb.Api

  def render("index.json", %{user_with_events: %{events: events} = user_with_events}) do
    user =
      Map.take(user_with_events, Map.keys(user_with_events) -- [:events])
    %{data: %{
      user: user,
      events: render_many(events, Api.EventView, "event.json")
    }}
  end

  def render("index.json", %{events: events}) do
    %{data: render_many(events, Api.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    event
  end

end
