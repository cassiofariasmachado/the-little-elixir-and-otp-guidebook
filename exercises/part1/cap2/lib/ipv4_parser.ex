defmodule Cap2.IPV4 do
  def parse(bytes) do
    <<version::size(4),
      header_length::size(4),
      tos::binary-size(1),
      total_length::binary-size(2),
      identification::binary-size(2),
      flags::binary-size(1),
      fragment::binary-size(1),
      time_to_live::binary-size(1),
      protocol::binary-size(1),
      header_checksum::binary-size(2),
      source_address::binary-size(4),
      destination_address::binary-size(4)>> = bytes

    %{
      version: version,
      header_length: header_length,
      tos: tos,
      total_length: total_length,
      identification: identification,
      flags: flags,
      fragment: fragment,
      time_to_live: time_to_live,
      protocol: protocol,
      header_checksum: header_checksum,
      source_address: source_address,
      destination_address: destination_address
    }
  end
end
