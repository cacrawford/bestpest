defmodule Bestpest.Helper do
  @moduledoc false

  @doc """
  Returns the current user name in session in a Hash
  """
  def current_user_name(conn) do
    Addict.Helper.current_user(conn)
    |> Bestpest.User.fetch_name_by_email()
  end

  def formatted_date(date) do
    case Timex.format(date, "{YYYY}-{M}-{D}") do
      {:ok, formatted} ->
        formatted
      {:error, _err} ->
        "Unknown"
    end
  end

end
