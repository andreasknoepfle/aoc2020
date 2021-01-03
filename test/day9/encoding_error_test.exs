defmodule Aoc.EncodingErrorTest do
  use ExUnit.Case

  import Aoc.EncodingError

  @input [
    35,
    20,
    15,
    25,
    47,
    40,
    62,
    55,
    65,
    95,
    102,
    117,
    150,
    182,
    127,
    219,
    299,
    277,
    309,
    576
  ]

  describe "error_number/1" do
    test "returns the erroneous number" do
      assert error_number(@input, 5) == 127
    end
  end

  describe "encryption_weakness/1" do
    test "returns the weakness" do
      assert encryption_weakness(@input, 5) == 62
    end
  end
end
