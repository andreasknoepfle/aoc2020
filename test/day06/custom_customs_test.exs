defmodule Aoc.CustomCustomsTest do
  use ExUnit.Case

  import Aoc.CustomCustoms

  @input """
  abc

  a
  b
  c

  ab
  ac

  a
  a
  a
  a

  b
  """

  describe "sum/1 with any" do
    test "counts the number of customs in all groups" do
      assert sum(@input, "any") == 11
    end
  end

  describe "sum/1 with all" do
    test "counts the matching number of customs in all groups" do
      assert sum(@input, "all") == 6
    end
  end
end
