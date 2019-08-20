defmodule TwelveDaysApiWeb.Api.EventController do

  use TwelveDaysApiWeb, :controller
  alias TwelveDaysApi.Users


  def index(conn, %{"user_id" => user_id}) do
    user_with_events =
      Users.get_user!(user_id)
      |> TwelveDaysApi.Repo.preload(:events)

    # events = Users.get_user!(user_id)
    # |> Users.list_user_events
    render(conn, "index.json", user_with_events: user_with_events)
  end


end
