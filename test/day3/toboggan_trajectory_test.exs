defmodule Aoc.TobogganTrajectoryTest do
  use ExUnit.Case

  import Aoc.TobogganTrajectory

  @test_trees """
                ..##.......
                #...#...#..
                .#....#..#.
                ..#.#...#.#
                .#...##..#.
                ..#.##.....
                .#.#.#....#
                .#........#
                #.##...#...
                #...##....#
                .#..#...#.#
              """
              |> String.trim()
              |> String.split("\n")
              |> Enum.map(&String.trim/1)

  describe "tree_count/1" do
    test "counts trees" do
      assert tree_count(@test_trees) == 7
    end
  end
end
