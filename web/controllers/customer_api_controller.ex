defmodule Bestpest.CustomerApiController do
  use Bestpest.Web, :controller

  alias Bestpest.Customer

  def index(conn, _params) do
    customers = Repo.all(Bestpest.Customer)
    json conn, customers
  end

  def create(conn, params) do

    IO.inspect(conn)
    IO.puts("printing params")
    IO.inspect(params)
    IO.puts("printed params")
    changeset = Customer.changeset(%Customer{}, params)

    case Repo.insert(changeset) do
      {:ok, customer} ->
        IO.inspect(customer)
        json conn |> put_status(:created), customer
      {:error, changeset} ->
        IO.inspect(changeset)
        json conn |> put_status(:bad_request), %{errors: ["Error creating customer"] }
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Bestpest.Customer, String.to_integer(id))
    json conn, user
  end
end
