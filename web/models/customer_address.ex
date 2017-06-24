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
      |> cast(params, [
             :type,
             :first_name,
             :last_name,
             :street,
             :city,
             :state,
             :zip
         ])
      |> validate_required([
             :type,
             :first_name,
             :last_name,
             :street,
             :city,
             :state,
             :zip
         ])
      |> validate_format(:zip, ~r/^\d{5}(?:[-\s]\d{4})?$/)
      |> validate_format(:state, ~r/^[a-zA-Z]{2}$/)
      |> validate_inclusion(:type, ["Billing", "Residential"])
    end
end
