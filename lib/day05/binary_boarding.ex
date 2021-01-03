defmodule Aoc.BinaryBoarding do
  def highest_seat_id(input) do
    input
    |> Enum.map(&seat_id/1)
    |> Enum.max()
  end

  def my_seat_id(input) do
    input
    |> Enum.map(&seat_id/1)
    |> Enum.sort()
    |> Enum.chunk_every(2, 1)
    |> Enum.find(fn [number, other_number] -> number + 1 != other_number end)
    |> List.first()
    |> Kernel.+(1)
  end

  defp seat_id(<<row_coded::binary-size(7)>> <> <<column_coded::binary-size(3)>>) do
    <<row_decoded::7>> = decode(row_coded)
    <<column_decoded::3>> = decode(column_coded)
    row_decoded * 8 + column_decoded
  end

  defp decode(""), do: ""
  defp decode("F" <> rest), do: <<0::1, decode(rest)::bitstring>>
  defp decode("L" <> rest), do: <<0::1, decode(rest)::bitstring>>
  defp decode("B" <> rest), do: <<1::1, decode(rest)::bitstring>>
  defp decode("R" <> rest), do: <<1::1, decode(rest)::bitstring>>
end
