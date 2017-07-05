defmodule :"Elixir.Bestpest.Repo.Migrations.No-duplicates" do
  use Ecto.Migration

  def change do

    create unique_index :customer_addresses, [:customer_id, :street, :city, :zip]
    create unique_index :customer_phones, [:customer_id, :phone_number]
    create unique_index :customer_emails, [:customer_id, :email]

  end
end
