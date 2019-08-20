defmodule TwelveDaysApiWeb.Api.UserController do

  use TwelveDaysApiWeb, :controller
  alias TwelveDaysApi.Users
  alias TwelveDaysApi.Users.User

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.json", data: users)
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, "user.json", user: user)
  end


end
