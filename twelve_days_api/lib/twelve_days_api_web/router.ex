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

    # auth
    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
    post "/auth", SessionController, :create

    get "/registration", UserController, :new
    resources "/users", UserController, only: [:index, :show]

  end


  scope "/api", TwelveDaysApiWeb do
    pipe_through :api
    resources "/users", Api.UserController, only: [:index, :show]
  end


  # Other scopes may use custom stacks.
  # scope "/api", TwelveDaysApiWeb do
  #   pipe_through :api
  # end
end
