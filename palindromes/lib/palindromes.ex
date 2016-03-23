defmodule Palindromes do
  @doc "Returns true if string is a palindrome"
  def palindrome?(a) when is_binary(a) do
    palindrome([{:string, a},
                {:start, 0},
                {:end, String.length(a) - 1}])
  end

  defp palindrome(args) do
    if args[:start] < args[:end] do
      chars_equals?(args[:string], args[:start], args[:end])
      and palindrome([{:string, args[:string]},
                      {:start, args[:start] + 1},
                      {:end, args[:end] - 1}])
    else
      chars_equals?(args[:string], args[:start], args[:end])
    end
  end

  defp chars_equals?(string, s, e) do
    String.at(string, s) == String.at(string, e)
  end

  @doc "Returns if a string can be a palindrome rearranging it"
  def build_palindrome_if_possible(string) when is_binary(string) do
    letters = build_letters_map(string)
    case more_than_one_odd(letters) do
      true -> "Not possible"
      false ->
        palindrome =
          letters
          |> Enum.reduce("", fn ({key, value}, acc) ->
            cond do
              rem(value, 2) == 0 -> acc <> String.duplicate(key, div(value, 2))
              true -> acc
            end
          end)
        {key, _} = letters |> Enum.find(fn ({_, value}) -> rem(value, 2) == 1 end)
        invertedPalindrome = palindrome |> String.reverse
        palindrome <> key <> invertedPalindrome
    end
  end

  def build_letters_map(string) do
    String.graphemes(string)
      |>  Enum.reduce(Map.new, fn (char, acc) ->
            case Map.has_key?(acc, char) do
              true ->
                Map.put(acc, char, acc[char] + 1)
              false ->
                Map.put(acc, char, 1)
            end
          end)
  end

  def more_than_one_odd(map) do
    map |> Enum.reduce(0, fn({_, value}, acc) ->
      case rem(value, 2) do
        1 -> acc + 1
        _ -> acc
      end
    end) > 1
  end
end
