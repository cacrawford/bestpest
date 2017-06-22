defmodule Bestpest.CustomerPhone do
    use Bestpest.Web, :model

    schema "customer_phones" do
      belongs_to :customer, Bestpest.Customer
      field :phone_number, :string
      field :type, :string
      field :primary, :boolean
      field :use_for_text, :boolean

      timestamps()
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:phone_number, :type])
      |> validate_required([:phone_number, :type])
      |> validate_inclusion(:type, ["Home", "Work", "Cell", "Business", "Fax", "Other"])
      |> validate_format(:phone_number, ~r/^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/)
    end
end
