defmodule Aoc do
  def day(1, [], input), do: day(1, ["2"], input)

  def day(1, [k], %{"numbers" => numbers}) do
    numbers
    |> as_numbers()
    |> Aoc.ExpenseReport.repair(String.to_integer(k))
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
