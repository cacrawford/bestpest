defmodule Bestpest.User do
  use Bestpest.Web, :model
  alias Bestpest.Repo

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string

    timestamps()
  end

  def fetch_name_by_email(user) do
    Repo.get_by!(Bestpest.User, email: user.email).name
  end

end
