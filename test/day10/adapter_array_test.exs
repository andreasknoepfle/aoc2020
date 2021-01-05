defmodule Aoc.AdapterArrayTest do
  use ExUnit.Case

  import Aoc.AdapterArray

  @input [
    28,
    33,
    18,
    42,
    31,
    14,
    46,
    20,
    48,
    47,
    24,
    23,
    49,
    45,
    19,
    38,
    39,
    11,
    1,
    32,
    25,
    35,
    8,
    17,
    7,
    9,
    4,
    2,
    34,
    10,
    3
  ]

  @other_input [1, 2, 4, 7, 8, 9, 10]

  describe "result/1" do
    test "returns the result" do
      assert result(@input) == 220
    end
  end

  describe "options_count/1" do
    test "returns the result" do
      assert options_count(@other_input) == 12
      assert options_count(@input) == 19208
    end
  end
end
