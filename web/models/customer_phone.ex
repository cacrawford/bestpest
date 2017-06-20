defmodule Bestpest.CustomerPhone do
    use Bestpest.Web, :model

    schema "customer_phones" do
      belongs_to :customer, Bestpest.Customer
      field :phone_number, :string
      field :type, :string              # Home, Work, Cell
      field :primary, :boolean

      timestamps()
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:phone_number, :type])
      |> validate_required([:phone_number, :type])
    end
end
