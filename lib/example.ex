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

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def main do
    numbers = ["1", "2", "3", "4", "5", "6"]

    # capture non anonymous function and convert to anonymous ( & )
    result = Enum.map(numbers, &String.to_integer/1)
    # IO.inspect(result)
    IO.inspect(sum_and_average(result))

    # numbers = [1, 2, 3, 4, 5]
    # Enum.each(numbers, fn num -> IO.puts(num) end)

    # grades = [25, 50, 75, 100]
    # new = for n <- grades, do: n + 5
    # IO.inspect(new)
    # new = new ++ [125]
    # IO.inspect(new)
    # new = new ++ [150, 175]
    # IO.inspect(new)

    # final = [5 | new]
    # IO.inspect(final)

    # even = for n <- final, Integer.is_even(n), do: n
    # IO.inspect(even)
  end
end
