defmodule TwelveDaysApiWeb.Api.EventController do

  use TwelveDaysApiWeb, :controller
  alias TwelveDaysApi.Users


  def index(conn, %{"user_id" => user_id}) do
    user_with_events =
      Users.get_user!(user_id)
      |> TwelveDaysApi.Repo.preload(:events)
    render(conn, "index.json", user_with_events: user_with_events)
  end

  def index(conn, _) do
    user_id = get_session(conn, :current_user_id)
    if(user_id) do
      user_with_events =
      Users.get_user!(user_id)
      |> TwelveDaysApi.Repo.preload(:events)
      render(conn, "index.json", user_with_events: user_with_events)
    else
      render(conn, "none.json")
    end

  end


end
