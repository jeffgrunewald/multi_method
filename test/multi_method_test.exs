defmodule MultiMethodTest do
  use ExUnit.Case
  doctest MultiMethod

  test "greets the world" do
    assert MultiMethod.hello() == :world
  end
end
