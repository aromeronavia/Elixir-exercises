defmodule PalindromesTest do
  use ExUnit.Case
  doctest Palindromes

  test "Word is a palindrome" do
    assert Palindromes.palindrome?("anitalavalatina") == true
    assert Palindromes.palindrome?("oso") == true
    assert Palindromes.palindrome?("jaja") == false
    assert Palindromes.palindrome?("aaasaab") == false
  end

  test "Can build a palindrome with given words" do
    assert Palindromes.build_palindrome_if_possible("icvic")
           |> Palindromes.palindrome?
    assert Palindromes.build_palindrome_if_possible("oos")
           |> Palindromes.palindrome?
    assert Palindromes.build_palindrome_if_possible("anitalavalatian")
           |> Palindromes.palindrome?
    assert Palindromes.build_palindrome_if_possible("super") == "Not possible"
  end
end
