defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 20}
    platinum_membership = %Membership{type: :platinum, price: 15}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "Shobhit", membership: gold_membership},
      %User{name: "Sumit", membership: silver_membership},
      %User{name: "NO NAME", membership: platinum_membership},
      %User{name: "Ram", membership: none_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership paying #{membership.price}")
    end)

    IO.puts("example output")
  end
end
