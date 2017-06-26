defmodule Bestpest.CustomerApiController do
  use Bestpest.Web, :controller

  def index(conn, _params) do
    customers = Repo.all(Bestpest.Customer)
    json conn, customers
  end

  def create(conn, _params) do

  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Bestpest.Customer, String.to_integer(id))
    json conn, user
  end
end
