defmodule Aoc.PassportProcessing do
  @required ~w[byr iyr eyr hgt hcl ecl pid]
  def valid_count(input, strictness) do
    input
    |> String.split(~r/\s\s/)
    |> Enum.map(&to_passport/1)
    |> Enum.filter(&valid?(&1, strictness))
    |> Enum.count()
  end

  defp to_passport(passport_data) do
    passport_data
    |> String.split(~r/\s/, trim: true)
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.into(%{}, fn [k, v] -> {k, v} end)
  end

  defp valid?(passport, "loose") do
    fields = passport |> Map.keys()

    @required
    |> Enum.all?(&Enum.member?(fields, &1))
  end

  defp valid?(passport, "strict") do
    valid?(passport, "loose") &&
      valid_number?(passport["byr"], 1920, 2002) &&
      valid_number?(passport["iyr"], 2010, 2020) &&
      valid_number?(passport["eyr"], 2020, 2030) &&
      valid_height?(passport["hgt"]) &&
      valid_color?(passport["hcl"]) &&
      valid_eye_color?(passport["ecl"]) &&
      valid_pid?(passport["pid"])
  end

  defp valid_number?(string, from, to) when is_binary(string) do
    valid_number?(string |> String.to_integer(), from, to)
  rescue
    ArgumentError -> false
  end

  defp valid_number?(integer, from, to) when integer >= from and integer <= to, do: true

  defp valid_number?(_, _, _), do: false

  defp valid_height?(<<number::binary-size(3)>> <> "cm") do
    valid_number?(number, 150, 193)
  end

  defp valid_height?(<<number::binary-size(2)>> <> "in") do
    valid_number?(number, 59, 76)
  end

  defp valid_height?(_), do: false

  defp valid_color?(color) do
    Regex.match?(~r/^#([a-f0-9]{6})$/, color)
  end

  defp valid_eye_color?(eyecolor) when eyecolor in ~w[amb blu brn gry grn hzl oth], do: true

  defp valid_eye_color?(_), do: false

  defp valid_pid?(pid) do
    Regex.match?(~r/^([0-9]{9})$/, pid)
  end
end
