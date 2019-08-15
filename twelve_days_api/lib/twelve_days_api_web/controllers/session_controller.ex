defmodule TwelveDaysApiWeb.SessionController do
  use TwelveDaysApiWeb, :controller

  # def create(conn, %{"user" => user_params}) do


  # end

  def delete(conn, _) do
    conn
    |> configure_session(drop: true)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end


