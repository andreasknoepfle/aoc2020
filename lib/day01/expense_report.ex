defmodule Aoc.ExpenseReport do
  @magic_number 2020

  def repair(input, k \\ 2) do
    input
    |> all_permutations(k)
    |> Enum.find(&(Enum.sum(&1) == @magic_number))
    |> case do
      nil -> raise "Elves made mistakes! Wrong input!"
      array -> Enum.reduce(array, &(&1 * &2))
    end
  end

  defp all_permutations(_, 0), do: [[]]

  defp all_permutations(list, k) do
    for head <- list, tail <- all_permutations(list, k - 1), do: [head | tail]
  end
end
