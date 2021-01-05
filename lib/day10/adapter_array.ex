defmodule Aoc.AdapterArray do
  def result(input) do
    %{1 => diff1, 3 => diff3} =
      input
      |> Enum.sort()
      |> adapter_differences(0)
      |> Enum.frequencies()

    diff1 * diff3
  end

  defp adapter_differences([], _), do: [3]

  defp adapter_differences([head | tail], joltage) do
    [head - joltage | adapter_differences(tail, head)]
  end

  def options_count(input) do
    input
    |> Enum.sort()
    |> Enum.chunk_while(
      {[], 0, 0},
      fn
        adapter, {chunk, joltage, start} when adapter < joltage + 3 ->
          {:cont, {[adapter | chunk], adapter, start}}

        adapter, {[], joltage, _} when adapter == joltage + 3 ->
          {:cont, {[], adapter, adapter}}

        adapter, {chunk, joltage, start} when adapter == joltage + 3 ->
          {:cont,
           Enum.reverse(chunk)
           |> options(start), {[], adapter, adapter}}
      end,
      fn
        {[], _} ->
          {:cont, []}

        {chunk, _, start} ->
          {:cont,
           Enum.reverse(chunk)
           |> options(start), []}
      end
    )
    |> Enum.reduce(&Kernel.*/2)
  end

  defp options([element], joltage) when element <= joltage + 3, do: 1

  defp options([head | tail], joltage) when head <= joltage + 3,
    do: options(tail, head) + options(tail, joltage)

  defp options(_, _), do: 0
end
