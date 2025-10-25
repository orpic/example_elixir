defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    memberships = {:gold, :silver, :platinum}
    memberships = Tuple.append(memberships, :golden)

    prices = {4, 10, 15}

    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts(avg)

    IO.puts(
      "Average price from #{elem(memberships, 0)}, #{elem(memberships, 1)}, #{elem(memberships, 2)} is #{avg}"
    )

    users = [{"Shobhit", :gold}, {"Sumit", :silver}, {"NO NAME", :platinum}, {"Ram", :platinum}]

    Enum.each(users, fn {name, membership} -> IO.puts("#{name} has a #{membership}") end)

    IO.puts("example output")
  end
end
