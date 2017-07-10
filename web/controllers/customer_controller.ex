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

  def new(conn, params) do

  end

  def show(conn, %{"id" => customer_id}) do
    customer = Customer.load(customer_id)
    render conn, "show.html", customer: customer
  end

  def edit(conn, params) do

  end

  def create(conn, params) do

  end

  def update(conn, params) do

  end

  def delete(conn, %{"id" => customer_id}) do
      Repo.get!(Customer, customer_id)
      |> Repo.delete!

      conn
      |> put_flash(:info, "Customer Deleted")
      |> redirect(to: customer_path(conn, :index))
  end
end
