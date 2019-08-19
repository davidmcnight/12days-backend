defmodule TwelveDaysApiWeb.Router do
  use TwelveDaysApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TwelveDaysApiWeb do
    pipe_through :browser
    get "/", PageController, :index
    get "/registration", UserController, :new

    get "/login", SessionController, :new
    post "/auth", SessionController, :create
    get "/logout", SessionController, :delete

    resources "/users", UserController
    resources "/events", EventController do
      resources "/event_occurrences", EventOccurrenceController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", TwelveDaysApiWeb do
  #   pipe_through :api
  # end
end
