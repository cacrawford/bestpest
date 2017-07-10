defmodule Bestpest.Helper do
  @moduledoc false

  @doc """
  Returns the current user name in session in a Hash
  """
  def current_user_name(conn) do
    Addict.Helper.current_user(conn)
    |> Bestpest.User.fetch_name_by_email()
  end

end