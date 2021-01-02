defmodule Aoc.HandyHaversacks do
  def shiny_gold_options(input) do
    input
    |> Enum.into(%{}, &bag_rule/1)
    |> Enum.reduce(%{}, fn {outer, children}, reversed ->
      Enum.reduce(children, reversed, fn
        {_, inner}, acc -> Map.update(acc, inner, [outer], &(&1 ++ [outer]))
        _, acc -> acc
      end)
    end)
    |> count_options("shiny gold")
    |> Enum.count()
  end

  def shiny_gold_bags(input) do
    input
    |> Enum.into(%{}, &bag_rule/1)
    |> count_bags("shiny gold")
  end

  defp bag_rule(rule) do
    [bag, rest] = String.split(rule, " contain ")
    children = String.split(rest, ", ")
    {normalize(bag), Enum.map(children, &normalize/1)}
  end

  defp normalize(bag) do
    %{"color" => color, "count" => count} =
      Regex.named_captures(~r/(?<count>\d*)?\s?(?<color>[a-z\s]*)\sbags?\.?/, bag)

    case count do
      "" -> color
      value -> {String.to_integer(value), color}
    end
  end

  defp count_options(reversed_rules, bag) do
    reversed_rules
    |> Map.fetch(bag)
    |> case do
      {:ok, list} ->
        (list ++ (list |> Enum.flat_map(&count_options(reversed_rules, &1)))) |> Enum.uniq()

      _ ->
        []
    end
  end

  defp count_bags(bag_rules, bag) do
    case Map.fetch!(bag_rules, bag) do
      ["no other"] ->
        0

      children ->
        children
        |> Enum.map(fn {count, color} -> count + count * count_bags(bag_rules, color) end)
        |> Enum.sum()
    end
  end
end
