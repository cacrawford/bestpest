defmodule Bestpest.CustomerEmail do
  use Bestpest.Web, :model

  schema "customer_emails" do
    belongs_to :customer, Bestpest.Customer
    field :email, :string
    field :primary, :boolean

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :primary])
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
  end

end
