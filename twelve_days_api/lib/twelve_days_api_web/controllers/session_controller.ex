defmodule TwelveDaysApiWeb.SessionController do
  use TwelveDaysApiWeb, :controller

  alias TwelveDaysApi.Users
  alias TwelveDaysApi.Users.User

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    user = Users.get_user_by_email!(email)
    case Users.verify_password(user, password) do
    :ok ->
      conn
      |> put_session(:current_user_id, user.id)
      |> put_flash(:info, "Signed in successfully.")
      |> redirect(to: Routes.user_path(conn, :index))
    {:error, _} ->
      conn
      |> put_flash(:error, "There was a problem with your username/password")
      |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> clear_session()
    |> configure_session(drop: true)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end


