defmodule Cap2.IPV4Test do
  use ExUnit.Case

  alias Cap2.IPV4

  test "parse ipv4 packet correctly" do
    packet = "\x45\x00\x00\x44\xad\x0b\x00\x00\x40\x11\x72\x72\xac\x14\x02\xfd\xac\x14\x00\x06"

    response = IPV4.parse(packet)

    assert %{
             destination_address: <<172, 20, 0, 6>>,
             flags: <<0>>,
             fragment: <<0>>,
             header_checksum: "rr",
             header_length: 5,
             identification: <<173, 11>>,
             protocol: <<17>>,
             source_address: <<172, 20, 2, 253>>,
             time_to_live: "@",
             tos: <<0>>,
             total_length: <<0, 68>>,
             version: 4
           } = response
  end
end
