defmodule TwelveDaysApiWeb.UserView do
  use TwelveDaysApiWeb, :view
  alias TwelveDaysApiWeb.UserView

  def render("users.json", %{users: users}) do
    %{users: render_many(users, UserView, "users.json")}
  end

end
