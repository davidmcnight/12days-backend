defmodule TwelveDaysApiWeb.Session do


  def create(conn, %{"user" => user_params}) do


  end

  def delete(conn, %{"id" => id}) do
    conn
    |> clear_session
  end
end


