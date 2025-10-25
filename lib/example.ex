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
    coreect = :rand.uniform(11) - 1
    IO.puts(coreect)
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      {result, ""} -> IO.puts("success #{result}")
      {result, other} -> IO.puts("Parse partial: #{result} and other #{other}")
      :error -> IO.puts("something went wrong")
    end
  end
end
