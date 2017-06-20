defmodule Bestpest.CustomerAddress do
    use Bestpest.Web, :model

    schema "customer_addresses" do
      belongs_to :customer, Bestpest.Customer
      field :type, :string              # Business or residential
      field :attn, :string
      field :first_name, :string
      field :last_name, :string
      field :street, :string
      field :city, :string
      field :state, :string
      field :zip, :string

      timestamps()
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:customerId])
      |> validate_required([:customerId])
    end
end
