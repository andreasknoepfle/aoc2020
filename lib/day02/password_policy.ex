defmodule Aoc.PasswordPolicy do
  @expression_regex ~r/(?<from>[\d]+)\-(?<to>[\d]+)\s(?<char>.):\s(?<password>.*)/

  def valid_count(input, type) do
    input
    |> Enum.filter(&valid?(&1, type))
    |> Enum.count()
  end

  defp valid?(password_expression, "old") do
    %{"from" => from, "to" => to, "char" => char, "password" => password} =
      Regex.named_captures(@expression_regex, password_expression)

    count =
      password
      |> String.codepoints()
      |> Enum.filter(&(&1 == char))
      |> Enum.count()

    count >= String.to_integer(from) && count <= String.to_integer(to)
  end

  defp valid?(password_expression, "new") do
    %{"from" => index1, "to" => index2, "char" => char, "password" => password} =
      Regex.named_captures(@expression_regex, password_expression)

    count =
      [index1, index2]
      |> Enum.map(fn index -> String.at(password, String.to_integer(index) - 1) end)
      |> Enum.filter(&(&1 == char))
      |> Enum.count()

    count == 1
  end
end
