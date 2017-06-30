defmodule Bestpest.CustomerApiView do
  use Bestpest.Web, :view

  def render("create.json", %{customer: customer}) do
    customer
  end

  def render("index.json",  %{customers: customers}) do
    customers
  end
  
end
