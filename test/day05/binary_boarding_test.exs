defmodule Aoc.BinaryBoardingTest do
  use ExUnit.Case

  import Aoc.BinaryBoarding

  @input ~w[BFFFBBFRRR FFFBBBFRRR BBFFBBFRLL]

  describe "seat/1" do
    test "returns the correct seat" do
      assert highest_seat_id(@input) == 820
    end
  end
end
