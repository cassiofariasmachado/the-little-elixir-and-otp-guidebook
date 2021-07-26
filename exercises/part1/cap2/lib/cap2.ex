defmodule Cap2 do
  alias Cap2.IPV4

  @moduledoc """
  Documentation for `Cap2`.
  """

  @doc """
  Sum two numbers.

  ## Examples

    iex> Cap2.sum([])
    0

    iex> Cap2.sum([1, 2, 3])
    6
  """
  def sum([]), do: 0
  def sum(list), do: Enum.reduce(list, &(&1 + &2))

  @doc """
  Pow the number by the exponent.

  ## Examples

    iex> Cap2.pow(2, 2)
    4

    iex> Cap2.pow(3, 3)
    27
  """
  def pow(number, exponent) when is_integer(number), do: :math.pow(number, exponent) |> trunc()

  @doc """
  Pow, flatten and sort desc a list.

  ## Examples

    iex> Cap2.flat_reverse_pow_with_pipe([1,[[2],3]])
    [9, 4, 1]
  """
  def flat_reverse_pow_with_pipe(list) do
    Stream.flat_map(list, fn elem -> flat_pow(elem) end)
    |> Enum.sort(:desc)
  end

  defp flat_pow([]), do: []
  defp flat_pow(elem) when not is_list(elem), do: [pow(elem, 2)]
  defp flat_pow(list) when is_list(list), do: flat_reverse_pow_with_pipe(list)

  @doc """
  Pow, flatten and sort desc a list.

  ## Examples

    iex> Cap2.flat_reverse_pow_without_pipe([1,[[2],3]])
    [9, 4, 1]
  """
  def flat_reverse_pow_without_pipe(list) do
    Enum.sort(flatten_pow(list), :desc)
  end

  defp flatten_pow([]), do: []
  defp flatten_pow([head | tail]), do: flatten_pow(head) ++ flatten_pow(tail)
  defp flatten_pow(head), do: [pow(head, 2)]

  @doc """
  Hash string using MD5.

  ## Examples

    iex> Cap2.md5("Tales from the Crypt")
    "4F84EB4D03E07958624B3D433E10E95B"
  """
  def md5(string), do: :crypto.hash(:md5, string) |> Base.encode16()

  @doc """
  Parse IPV4 packet.
  """
  def parse_ipv4_packet(bytes) when is_binary(bytes), do: IPV4.parse(bytes)
end
