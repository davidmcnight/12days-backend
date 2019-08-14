defmodule TwelveDaysApiWeb.PageController do
  use TwelveDaysApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
