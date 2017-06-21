defmodule Bestpest.CustomerAddressTest do
  use Bestpest.ModelCase

  alias Bestpest.CustomerAddress

  test "Happy path" do
    changeset = CustomerAddress.changeset(%CustomerAddress{}, %{
            type: "Business",
            attn: "Some Name",
            first_name: "Bob",
            last_name: "Bobberson",
            street: "135 Some Street",
            city: "SomeTown",
            state: "TX",
            zip: "75018"
    })

    assert changeset.valid?
  end

  test "With extended zip" do
    changeset = CustomerAddress.changeset(%CustomerAddress{}, %{
            type: "Business",
            attn: "Some Name",
            first_name: "Bob",
            last_name: "Bobberson",
            street: "135 Some Street",
            city: "SomeTown",
            state: "TX",
            zip: "75018-1234"
    })

    assert changeset.valid?
  end

  test "With invalid zip" do
    changeset = CustomerAddress.changeset(%CustomerAddress{}, %{
            type: "Business",
            attn: "Some Name",
            first_name: "Bob",
            last_name: "Bobberson",
            street: "135 Some Street",
            city: "SomeTown",
            state: "TX",
            zip: "7518"
    })

    refute changeset.valid?
  end

  test "With invalid state abbreviation" do
    changeset = CustomerAddress.changeset(%CustomerAddress{}, %{
            type: "Business",
            attn: "Some Name",
            first_name: "Bob",
            last_name: "Bobberson",
            street: "135 Some Street",
            city: "SomeTown",
            state: "Texas",
            zip: "75018"
    })

    refute changeset.valid?
  end

  test "With invalid type" do
    changeset = CustomerAddress.changeset(%CustomerAddress{}, %{
            type: "Vacation",
            attn: "Some Name",
            first_name: "Bob",
            last_name: "Bobberson",
            street: "135 Some Street",
            city: "SomeTown",
            state: "Texas",
            zip: "75018"
    })

    refute changeset.valid?
  end

end
