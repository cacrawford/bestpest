defmodule Bestpest.Customer do
    use Bestpest.Web, :model
    alias Bestpest.Repo

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
      has_many :customer_addresses, Bestpest.CustomerAddress
      has_many :customer_phones, Bestpest.CustomerPhone
      has_many :customer_comments, Bestpest.CustomerComment
      has_many :customer_emails, Bestpest.CustomerEmail

      timestamps()
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> Repo.preload([
             :customer_addresses,
             :customer_phones,
             :customer_comments,
             :customer_emails
         ])
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
      |> cast_assoc(:customer_addresses, required: false)
      |> cast_assoc(:customer_phones, required: false)
      |> cast_assoc(:customer_comments, required: false)
      |> cast_assoc(:customer_emails, required: false)
      |> validate_required([:ref_id, :type])
    end
end
