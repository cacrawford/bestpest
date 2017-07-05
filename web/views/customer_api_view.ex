defmodule Bestpest.CustomerApiView do
  use Bestpest.Web, :view

  def render("create.json", %{customer: customer}) do
    customer
  end

  def render("index.json",  %{customers: customers}) do
    customers
  end

  def render("error.json", %{error: error}) do
    error
  end

  def render("index_of.json", %{customer: customer}) do
    customer
  end

end
