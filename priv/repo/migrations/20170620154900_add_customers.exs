defmodule Bestpest.Repo.Migrations.AddCustomers do
  use Ecto.Migration

  def change do

    create table(:customers) do
      add :ref_id, :integer
      add :active, :boolean
      add :first_name, :string
      add :last_name, :string
      add :type, :string
      add :billed, :boolean
      add :corporate_code, :string
      add :lead_name, :string
      add :cancel_reason, :string
      add :subdivision, :string
      add :signup_date, :datetime
      add :cancel_date, :datetime

      timestamps()
    end

    create table(:customer_address) do
      add :customer_id, :integer
      add :type, :string
      add :attn, :string
      add :first_name, :string
      add :last_name, :string
      add :street, :string
      add :city, :string
      add :state, :string
      add :zip, :string

      timestamps()
    end

    create table(:customer_phone) do
      add :customer_id, :integer
      add :phone_number, :string
      add :type, :string
      add :primary, :boolean

      timestamps()
    end

    create table(:customer_comment) do
      add :customer_id, :integer
      add :comment, :string
      add :source, :string

      timestamps()
    end

  end
end
