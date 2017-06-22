defmodule Bestpest.Repo.Migrations.AddCustomers do
  use Ecto.Migration

  def change do

    create table(:customer) do
      add :ref_id, :integer
      add :active, :boolean
      add :first_name, :string
      add :last_name, :string
      add :type, :string, default: "Residential"
      add :billed, :boolean
      add :corporate_code, :string
      add :lead_name, :string
      add :cancel_reason, :string
      add :subdivision, :string
      add :signup_date, :utc_datetime
      add :cancel_date, :utc_datetime

      timestamps()
    end

    create index(:customer, [:ref_id])


    create table(:customer_address) do
      add :customer_id, references(:customer)
      add :type, :string, default: "Residential"
      add :attn, :string
      add :first_name, :string
      add :last_name, :string
      add :street, :string
      add :city, :string
      add :state, :string, size: 2
      add :zip, :string

      timestamps()
    endgi

    create index(:customer_address, [:customer_id])

    create table(:customer_phone) do
      add :customer_id, references(:customer)
      add :phone_number, :string
      add :type, :string, default: "Other"
      add :primary, :boolean, default: false
      add :use_for_text, :boolean

      timestamps()
    end

    create index(:customer_phone, [:customer_id])

    create table(:customer_comment) do
      add :customer_id, references(:customer)
      add :comment, :string, default: "Note"
      add :source, :string
      add :date_added, :utc_datetime
      add :user, :string

      timestamps()
    end

    create index(:customer_comment, [:customer_id])

    create table(:customer_email) do
      add :customer_id, references(:customer)
      add :email, :string
      add :primary, :boolean, default: false

      timestamps()
    end

    create index(:customer_email, [:customer_id])

  end
end
