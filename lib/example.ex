defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  require Integer
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    grades = [25, 50, 75, 100]
    new = for n <- grades, do: n + 5
    IO.inspect(new)
    new = new ++ [125]
    IO.inspect(new)
    new = new ++ [150, 175]
    IO.inspect(new)

    final = [5 | new]
    IO.inspect(final)

    even = for n <- final, Integer.is_even(n), do: n
    IO.inspect(even)
  end
end
