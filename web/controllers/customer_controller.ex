defmodule Bestpest.CustomerController do
  use Bestpest.Web, :controller

  alias Bestpest.Customer

  plug Addict.Plugs.Authenticated when action in [
    :index
  ]
  plug :action

  def index(conn, _params) do
    customers = Repo.all(Customer)
    render conn, "index.html", customers: customers
  end
end
