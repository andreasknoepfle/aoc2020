defmodule Aoc.PasswordPolicyTest do
  use ExUnit.Case

  import Aoc.PasswordPolicy

  describe "valid_count/2 with old policy" do
    test "counts the valid passwords" do
      assert valid_count(["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"], "old") == 2
    end
  end

  describe "valid_count/2 with new policy" do
    test "counts the valid passwords" do
      assert valid_count(["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"], "new") == 1
    end
  end
end
