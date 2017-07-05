defmodule Bestpest.CustomerComment do
    use Bestpest.Web, :model
    alias Bestpest.Repo

  schema "customer_comments" do
    belongs_to :customer, Bestpest.Customer
    field :comment, :string
    field :source, :string
    field :date_added, Ecto.DateTime
    field :user, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Repo.preload(:customer)
    |> cast(params, [:comment, :source, :date_added, :user])
    |> validate_required([:comment])
  end
end
