defmodule TwelveDaysApiWeb.UserView do
  use TwelveDaysApiWeb, :view
  alias TwelveDaysApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    user
  end

end
