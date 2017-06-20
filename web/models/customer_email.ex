defmodule CustomerEmail do
  use Bestpest.Web, :model

  schema "customer_emails" do
    belongs_to :customer, Bestpest.Customer
    field :email, :string
    field :primary, :boolean

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:customerId])
    |> validate_required([:customerId])
  end

end
