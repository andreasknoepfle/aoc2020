defmodule Mix.Tasks.Aoc do
  use Mix.Task

  @shortdoc "Run Advent of Code days"
  def run([day | arguments]) do
    path =
      :aoc
      |> :code.priv_dir()
      |> Path.join(Path.join(["input", "days", day]))

    inputs =
      path
      |> File.ls!()
      |> Enum.into(%{}, fn file -> {file, File.stream!(Path.join(path, file))} end)

    day
    |> String.to_integer()
    |> Aoc.day(arguments, inputs)
    |> IO.inspect()
  end
end
