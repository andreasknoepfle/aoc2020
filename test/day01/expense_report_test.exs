defmodule Aoc.ExpenseReportTest do
  use ExUnit.Case

  import Aoc.ExpenseReport

  describe "repair/1" do
    test "finds pairs that add to 2020 and multiplies them" do
      assert repair([2019, 1, 400]) == 2019
      assert repair([20, 2019, 1]) == 2019
      assert repair([20, 2018, 2]) == 2018 * 2
      assert repair([20, 4000, 2000]) == 2000 * 20
    end
  end

  describe "repair/2" do
    test "finds k numbers that add to 2020 and multiplies them" do
      assert repair([2000, 40, 1, 19], 3) == 2000 * 1 * 19
      assert repair([3, 200, 20, 19, 1800], 3) == 1800 * 20 * 200
    end
  end
end
