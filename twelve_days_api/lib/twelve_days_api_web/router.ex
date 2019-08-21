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
    plug :fetch_session
  end

  scope "/", TwelveDaysApiWeb do
    pipe_through :browser

    get "/", PageController, :index

    # auth
    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
    post "/auth", SessionController, :create
    get "/registration", UserController, :new
    post "/registration", UserController, :create
    get "/calendar", UserController, :index

    resources "/users", UserController, only: [:show, :edit, :update, :delete] do
      resources "/events", EventController
    end
  end

  scope "/admin", as: :admin, alias: TwelveDaysApiWeb do
    pipe_through :browser

    resources "/users", Admin.UserController, only: [:index, :show, :edit, :update, :delete] do
      resources "/events", Admin.EventController
    end
  end


  scope path: "/api", as: :api, alias: TwelveDaysApiWeb do
    pipe_through :api
    resources "/users", Api.UserController, only: [:index, :show] do
      resources "/events", Api.EventController, only: [:index]
    end
    resources "/events", Api.EventController, only: [:index]
  end
end
