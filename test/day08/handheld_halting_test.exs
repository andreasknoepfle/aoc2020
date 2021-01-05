defmodule Aoc.HandheldHaltingTest do
  use ExUnit.Case

  import Aoc.HandheldHalting

  @instructions """
                nop +0
                acc +1
                jmp +4
                acc +3
                jmp -3
                acc -99
                acc +1
                jmp -4
                acc +6
                """
                |> String.split("\n", trim: true)

  describe "accumulator_error_value/1" do
    test "returns the accumulator value before the error" do
      assert accumulator_error_value(@instructions) == 5
    end
  end

  describe "accumulator_value/1" do
    test "fixes the program and returns the accumulator" do
      assert accumulator_value(@instructions) == 8
    end
  end
end
