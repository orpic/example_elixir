defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    memberships = %{
      gold: :gold,
      silver: :silver,
      platinum: :platinum,
      none: :none
    }

    prices = %{
      gold: 25,
      silver: 20,
      platinum: 15,
      none: 0
    }

    users = [
      {"Shobhit", memberships.gold},
      {"Sumit", memberships.silver},
      {"NO NAME", memberships.platinum},
      {"Ram", memberships.platinum}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{membership} membership paying #{prices[membership]}")
    end)

    IO.puts("example output")
  end
end
