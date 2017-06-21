defmodule Bestpest.CustomerPhoneTest do
  use Bestpest.ModelCase

  alias Bestpest.CustomerPhone

  test "Happy path with valid phone and type" do
    changeset = CustomerPhone.changeset(%CustomerPhone{}, %{phone_number: "800-555-5555", type: "Business"})
    assert changeset.valid?
  end

  test "Happy path with phone numbers only" do
    changeset = CustomerPhone.changeset(%CustomerPhone{}, %{phone_number: "8005555555", type: "Home"})
    assert changeset.valid?
  end

  test "Invalid phone number" do
    changeset = CustomerPhone.changeset(%CustomerPhone{}, %{phone_number: "8005555ABC", type: "Home"})
    refute changeset.valid?
  end

  test "Invalid type" do
    changeset = CustomerPhone.changeset(%CustomerPhone{}, %{phone_number: "8005555555", type: "Booboo"})
    refute changeset.valid?
  end
end
