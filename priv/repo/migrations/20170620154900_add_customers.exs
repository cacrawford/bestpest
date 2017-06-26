defmodule Bestpest.Repo.Migrations.AddCustomers do
  use Ecto.Migration

  def change do

    create table(:customers) do
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

    create index(:customers, [:ref_id])

    create table(:customer_addresses) do
      add :customer_id, references(:customers)
      add :type, :string, default: "Residential"
      add :attn, :string
      add :first_name, :string
      add :last_name, :string
      add :street, :string
      add :city, :string
      add :state, :string, size: 2
      add :zip, :string

      timestamps()
    end

    create index(:customer_addresses, [:customer_id])

    create table(:customer_phones) do
      add :customer_id, references(:customers)
      add :phone_number, :string
      add :type, :string, default: "Other"
      add :primary, :boolean, default: false
      add :use_for_text, :boolean

      timestamps()
    end

    create index(:customer_phones, [:customer_id])

    create table(:customer_comments) do
      add :customer_id, references(:customers)
      add :comment, :string, default: "Note"
      add :source, :string
      add :date_added, :utc_datetime
      add :user, :string

      timestamps()
    end

    create index(:customer_comments, [:customer_id])

    create table(:customer_emails) do
      add :customer_id, references(:customers)
      add :email, :string
      add :primary, :boolean, default: false

      timestamps()
    end

    create index(:customer_emails, [:customer_id])

  end
end
