defmodule Aoc.CustomCustoms do
  def sum(input, method \\ "any") do
    input
    |> String.split(~r/\s\s/)
    |> Enum.map(&sum_group(&1, method))
    |> Enum.sum()
  end

  defp sum_group(group, "any") do
    group
    |> String.codepoints()
    |> Enum.reject(&Regex.match?(~r/\s/, &1))
    |> Enum.uniq()
    |> Enum.count()
  end

  defp sum_group(group, "all") do
    group
    |> String.split(~r/\s/, trim: true)
    |> Enum.map(&String.codepoints/1)
    |> Enum.reduce(&intersect/2)
    |> Enum.count()
  end

  def intersect(list, other_list) do
    uniq = list -- other_list
    list -- uniq
  end
end
