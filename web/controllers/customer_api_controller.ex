defmodule Bestpest.CustomerApiController do
  use Bestpest.Web, :controller

  alias Bestpest.Customer

#  plug Addict.Plugs.Authenticated when action in [
#    :index,
#    :create,
#    :show
#  ]
#  plug :action

  def index(conn, _params) do
    customers = Repo.all(Bestpest.Customer)
      |> Repo.preload([:customer_addresses, :customer_comments, :customer_emails, :customer_phones])

    render conn |> put_status(:ok), "index.json", customers: customers
  end

  def create(conn, params) do

    changeset = Customer.changeset(%Customer{}, params)
    case Repo.insert(changeset) do
      {:ok, customer} ->
        IO.puts "Customer after insert:"
        IO.inspect customer
        render conn |> put_status(:created), "create.json", customer: customer
      {:error, changeset} ->
        IO.inspect(changeset)
        render conn |> put_status(:bad_request), "error.json", error: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    customer_addresses = Bestpest.CustomerAddress |> where(customer_id: ^id)
    customer_comments = Bestpest.CustomerComment |> where(customer_id: ^id)
    customer_emails = Bestpest.CustomerEmail |> where(customer_id: ^id)
    customer_phones = Bestpest.CustomerPhone |> where(customer_id: ^id)

    customer = Customer
      |> where(id: ^id)
      |> preload(customer_addresses: ^customer_addresses)
      |> preload(customer_comments: ^customer_comments)
      |> preload(customer_emails: ^customer_emails)
      |> preload(customer_phones: ^customer_phones)
      |> Repo.one!

    json conn, customer
  end
end
