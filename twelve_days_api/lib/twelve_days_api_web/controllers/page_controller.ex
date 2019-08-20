defmodule TwelveDaysApiWeb.PageController do
  use TwelveDaysApiWeb, :controller
  alias TwelveDaysApi.Users

  def index(conn, _params) do
    user_id = get_session(conn, :current_user_id)
    if(user_id) do
      conn
      |> redirect(to: Routes.user_path(conn, :index))
    else
      render(conn, "index.html")
    end
  end
end
