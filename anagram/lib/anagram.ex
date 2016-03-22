defmodule Anagram do
  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
  	sort_string(a) == sort_string(b)
  end

  def sort_string(string) do
    String.to_char_list(string)
  	|> Enum.sort
  end
end
