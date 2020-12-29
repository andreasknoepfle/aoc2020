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

  defp lines(input) do
    Enum.map(input, &String.trim/1)
  end

  defp as_numbers(input) do
    input
    |> lines()
    |> Enum.map(&String.to_integer/1)
  end
end
