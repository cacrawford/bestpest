defmodule Bestpest.CustomerControllerTest do
  use Bestpest.ConnCase

  test "GET /customer", %{conn: conn} do
    conn = get conn, "/customer"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
