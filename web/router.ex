defmodule Bestpest.Router do
  use Bestpest.Web, :router
  use Addict.RoutesHelper

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

  scope "/customer", Bestpest do
    pipe_through :browser # Use the default browser stack

    get "/", CustomerController, :index
    post "/", CustomerController, :create
  end

  scope "/" do
    addict :routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bestpest do
  #   pipe_through :api
  # end
end
