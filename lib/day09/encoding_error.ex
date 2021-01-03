defmodule Aoc.EncodingError do
  def error_number([_ | tail] = input, preamble \\ 25) do
    {window, _} = Enum.split(input, preamble)
    number = Enum.at(input, preamble)

    if is_valid?(window, number) do
      error_number(tail, preamble)
    else
      number
    end
  end

  def encryption_weakness([_ | tail] = input, preamble \\ 25) do
    number = error_number(input, preamble)

    case sum_up_to(input, number) do
      {:ok, result} -> Enum.min(result) + Enum.max(result)
      :error -> encryption_weakness(tail, preamble)
    end
  end

  defp sum_up_to(input, number) do
    Enum.reduce_while(input, {[], 0}, fn
      _, {_, sum} when sum > number -> {:halt, :error}
      _, {numbers, sum} when sum == number -> {:halt, {:ok, numbers}}
      i, {numbers, sum} -> {:cont, {numbers ++ [i], sum + i}}
    end)
  end

  defp is_valid?([], _), do: false

  defp is_valid?([head | tail], number) do
    if head * 2 != number && Enum.member?(tail, number - head) do
      true
    else
      is_valid?(tail, number)
    end
  end
end
