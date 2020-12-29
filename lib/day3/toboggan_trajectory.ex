defmodule Aoc.TobogganTrajectory do
  def tree_count(input, slopes) when is_list(slopes) do
    slopes
    |> Enum.map(fn {right, down} -> tree_count(input, right, down) end)
    |> Enum.reduce(&(&1 * &2))
  end

  def tree_count(input, right \\ 3, down \\ 3) do
    input
    |> Enum.take_every(down)
    |> Enum.reduce({0, 0}, fn track, {index, trees} ->
      tree =
        case String.at(track, rem(index, String.length(track))) do
          "#" -> 1
          "." -> 0
        end

      {index + right, trees + tree}
    end)
    |> elem(1)
  end
end
