defmodule Bestpest.CustomerComment do
    use Bestpest.Web, :model

  schema "customer_comments" do
    belongs_to :customer, Bestpest.Customer
    field :comment, :string
    field :source, :string   # comments, notes, po

    timestamps()
  end
end
