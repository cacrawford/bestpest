defmodule :"Elixir.Bestpest.Repo.Migrations.More-user" do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :string
    end
  end
end
