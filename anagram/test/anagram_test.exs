defmodule AnagramTest do
  use ExUnit.Case
  doctest Anagram

  test "Both words are anagrams" do
    assert Anagram.anagrams?("jaja", "ajaj") == true
    assert Anagram.anagrams?("cheves", "sup") == false
    assert Anagram.anagrams?("Alberto", "otreblA") == true
    assert Anagram.anagrams?("Sup", "pus") == false
  end
end
