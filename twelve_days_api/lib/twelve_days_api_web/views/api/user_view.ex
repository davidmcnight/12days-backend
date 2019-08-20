defmodule TwelveDaysApiWeb.Api.UserView do
  use TwelveDaysApiWeb, :view
  alias TwelveDaysApiWeb.Api

  def render("index.json", %{data: users}) do
    %{data: render_many(users, Api.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    user
  end

end
