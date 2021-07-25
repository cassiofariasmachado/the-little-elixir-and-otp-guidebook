defmodule Metex do
  @moduledoc """
  Documentation for `Metex`.
  """

  @doc """
  Temperature of cities in degrees Celsius.

  ## Examples

      iex> Metex.temperature_of(["Singapore", "Monaco", "Vatican City", "Hong Kong", "Macau"])
      {:ok, "Monaco: 28.5 °C"}
      {:ok, "Vatican City: 31.6 °C"}
      {:ok, "Hong Kong: 29.8 °C"}
      {:ok, "Singapore: 28.9 °C"}
      {:ok, "Macau: 29.9 °C"}
  """
  def temperature_of(cities) do
    coordinator_pid = spawn(Metex.Coordinator, :loop, [[], Enum.count(cities)])

    cities
    |> Enum.each(fn city ->
      worker_pid = spawn(Metex.Worker, :loop, [])

      send(worker_pid, {coordinator_pid, city})
    end)
  end
end
