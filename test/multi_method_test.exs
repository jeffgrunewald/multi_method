import MultiMethod

defmodule MultiMethodTest do
  use ExUnit.Case
  doctest MultiMethod

  test "dispatches to simple atoms" do
    assert Foo.bar(2) == "Because I can : 4"
    assert Foo.bar(:kitten) == "Unhandled case : :kitten"
  end

  test "dispatches based on computed value" do
    assert Foo.baz(%{class: "s", name: "John"}) == "Important client John detected!"
    assert Foo.baz(%{class: "B", net_worth: 65_000}) == "Less valuable client : 65000"
  end
end

defmodule Foo do
  defmulti bar(val) do
    case val do
      val when is_integer(val) -> :integer
      val when is_binary(val) -> :string
      _ -> :shrug
    end
  end

  defmethod bar(:integer, val) do
    new_val = val * val
    "Because I can : #{new_val}"
  end
  defmethod bar(:string, val), do: "Received a #{val}"
  defmethod bar(_, val), do: "Unhandled case : #{inspect(val)}"

  defmulti baz(%{class: class} = client), do: class

  defmethod baz("s", %{name: name}), do: "Important client #{name} detected!"
  defmethod baz("B", %{net_worth: wealth}), do: "Less valuable client : #{wealth}"
end
