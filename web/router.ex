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


  scope "/" do
    addict :routes
  end

  scope "/" do
    pipe_through :browser

    get "/", Bestpest.HomeController, :index
  end

  scope "/customer", Bestpest do
    pipe_through :browser

    get "/", CustomerController, :index
  end

  scope "/api/v1", Bestpest do
    pipe_through(:api)

    get "/customers", CustomerApiController, :index
    get "/customers/:id", CustomerApiController, :show
    post "/customers", CustomerApiController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bestpest do
  #   pipe_through :api
  # end
end
