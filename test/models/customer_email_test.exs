defmodule Bestpest.CustomerEmailTest do
  use Bestpest.ModelCase

  alias Bestpest.CustomerEmail

  test "Happy path with valid email" do
    changeset = CustomerEmail.changeset(%CustomerEmail{}, %{email: "abc@def.com"})
    assert changeset.valid?
  end

  test "Fails with invalid email" do
    changeset = CustomerEmail.changeset(%CustomerEmail{}, %{email: "scooby-dooby-doo"})
    refute changeset.valid?
  end
end
