defmodule PalindromesTest do
  use ExUnit.Case
  doctest Palindromes

  test "Word is a palindrome" do
    assert Palindromes.palindrome?("anitalavalatina") == true
    assert Palindromes.palindrome?("oso") == true
    assert Palindromes.palindrome?("jaja") == false
    assert Palindromes.palindrome?("aaasaab") == false
  end
end
