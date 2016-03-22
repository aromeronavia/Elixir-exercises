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
end
