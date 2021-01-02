defmodule Aoc.HandheldHalting do
  def accumulator_error_value(instructions) do
    {_, accumulator} = debug(instructions, 0, 0, [], nil)
    accumulator
  end

  def accumulator_value(instructions, fix \\ 0) do
    case debug(instructions, 0, 0, [], fix) do
      {:terminated, accumulator} -> accumulator
      _ -> accumulator_value(instructions, fix + 1)
    end
  end

  defp debug(instructions, current, accumulator, _, _) when current >= length(instructions) do
    {:terminated, accumulator}
  end

  defp debug(instructions, current, accumulator, executed, fix) do
    if Enum.member?(executed, current) do
      {:loop, accumulator}
    else
      {jmp, diff} =
        instructions
        |> Enum.at(current)
        |> next(fix == current)

      debug(instructions, current + jmp, accumulator + diff, executed ++ [current], fix)
    end
  end

  defp next("nop " <> _, false), do: {1, 0}
  defp next("jmp " <> _, true), do: {1, 0}
  defp next("jmp " <> number, false), do: {String.to_integer(number), 0}
  defp next("nop " <> number, true), do: {String.to_integer(number), 0}
  defp next("acc " <> number, _), do: {1, String.to_integer(number)}
end
