defmodule Bestpest.Repo.Migrations.MoreCustomers do
  use Ecto.Migration

  def change do
    alter table(:customer_comment) do
      add :date_added, :datetime
      add :user, :string
    end

    alter table(:customer_phone) do
      add :use_for_text, :boolean
    end

    create table(:customer_email) do
      add :customer_id, :integer
      add :email, :string
      add :primary, :boolean

      timestamps()
    end

  end

end
