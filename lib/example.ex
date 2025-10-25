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

    user1 = {"Shobhit", :gold}
    user2 = {"Sumit", :silver}
    user3 = {"NO NAME", :platinum}

    {name, membership} = user1
    IO.puts("#{name} has a #{membership} membership")

    {name, membership} = user2
    IO.puts("#{name} has a #{membership} membership")

    {name, membership} = user3
    IO.puts("#{name} has a #{membership} membership")

    IO.puts("example output")
  end
end
