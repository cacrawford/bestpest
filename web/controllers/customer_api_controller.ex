defmodule Bestpest.CustomerApiController do
  use Bestpest.Web, :controller

  alias Bestpest.Customer

  def index(conn, _params) do
    customers = Repo.all(Bestpest.Customer)
      |> Repo.preload [:addresses, :comments, :emails, :phones]

    render conn |> put_status(:ok), "index.json", customers: customers
  end

  def create(conn, params) do

    changeset = Customer.changeset(%Customer{}, params)

    case Repo.insert(changeset) do
      {:ok, customer} ->
        customer = Repo.preload customer, [:addresses, :comments, :emails, :phones]
        render conn |> put_status(:created), "create.json", customer: customer
      {:error, _changeset} ->
        render conn |> put_status(:bad_request),  %{errors: ["Error creating customer"] }
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Repo.get(Bestpest.Customer, String.to_integer(id))
    json conn, customer
  end
end
