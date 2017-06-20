defmodule Bestpest.Customer do
    use Bestpest.Web, :model

    schema "customers" do
      field :ref_id, :string
      field :active, :boolean
      field :first_name, :string
      field :last_name, :string
      field :type, :string          # Rental Property | Commercial | Residential (default) | Property Management
      field :billed, :boolean
      field :corporate_code, :string
      field :lead_name, :string
      field :cancel_reason, :string
      field :subdivision, :string
      field :signup_date, Ecto.DateTime
      field :cancel_date, Ecto.DateTime
      has_many :addresses, Bestpest.CustomerAddress
      has_many :phones, Bestpest.CustomerPhone
      has_many :comments, Bestpest.CustomerComment

      timestamps()
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [
             :ref_id,
             :active,
             :first_name,
             :last_name,
             :type,
             :billed,
             :corporate_code,
             :lead_name,
             :cancel_reason,
             :subdivision,
             :signup_date,
             :cancel_date
         ])
      |> validate_required([:ref_id])
    end
end
