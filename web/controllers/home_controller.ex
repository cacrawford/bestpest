defmodule Bestpest.HomeController do
  use Bestpest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end