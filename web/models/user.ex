defmodule Bestpest.User do
  use Bestpest.Web, :model
  alias Bestpest.Repo

  schema "users" do
    field :email, :string
    field :encrypted_password, :string

    timestamps()
  end

end
