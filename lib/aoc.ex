defmodule Aoc do
  def day(1, [], input), do: day(1, ["2"], input)

  def day(1, [k], %{"numbers" => numbers}) do
    numbers
    |> as_numbers()
    |> Aoc.ExpenseReport.repair(String.to_integer(k))
  end

  def day(2, [type], %{"passwords" => passwords}) do
    passwords
    |> lines()
    |> Aoc.PasswordPolicy.valid_count(type)
  end

  def day(3, [type], %{"treemap" => treemap}) do
    input = lines(treemap)

    case type do
      "slope" ->
        Aoc.TobogganTrajectory.tree_count(input)

      "slopes" ->
        Aoc.TobogganTrajectory.tree_count(input, [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}])
    end
  end

  def day(4, [strictness], %{"passports" => passports}) do
    passports
    |> Enum.join()
    |> Aoc.PassportProcessing.valid_count(strictness)
  end

  def day(5, ["high"], %{"seats" => seats}) do
    seats
    |> lines()
    |> Aoc.BinaryBoarding.highest_seat_id()
  end

  def day(5, ["my"], %{"seats" => seats}) do
    seats
    |> lines()
    |> Aoc.BinaryBoarding.my_seat_id()
  end

  def day(6, [method], %{"customs" => customs}) do
    customs
    |> Enum.join()
    |> Aoc.CustomCustoms.sum(method)
  end

  def day(7, ["bags"], %{"bags" => bags}) do
    bags
    |> lines()
    |> Aoc.HandyHaversacks.shiny_gold_bags()
  end

  def day(7, _, %{"bags" => bags}) do
    bags
    |> lines()
    |> Aoc.HandyHaversacks.shiny_gold_options()
  end

  def day(8, ["fix"], %{"code" => instructions}) do
    instructions
    |> lines()
    |> Aoc.HandheldHalting.accumulator_value()
  end

  def day(8, _, %{"code" => instructions}) do
    instructions
    |> lines()
    |> Aoc.HandheldHalting.accumulator_error_value()
  end

  def day(9, ["weakness"], %{"xmas" => numbers}) do
    numbers
    |> lines()
    |> as_numbers()
    |> Aoc.EncodingError.encryption_weakness()
  end

  def day(9, _, %{"xmas" => numbers}) do
    numbers
    |> lines()
    |> as_numbers()
    |> Aoc.EncodingError.error_number()
  end

  def day(10, ["options"], %{"adapters" => adapters}) do
    adapters
    |> lines()
    |> as_numbers()
    |> Aoc.AdapterArray.options_count()
  end

  def day(10, _, %{"adapters" => adapters}) do
    adapters
    |> lines()
    |> as_numbers()
    |> Aoc.AdapterArray.result()
  end

  defp lines(input) do
    Enum.map(input, &String.trim/1)
  end

  defp as_numbers(input) do
    input
    |> lines()
    |> Enum.map(&String.to_integer/1)
  end
end
