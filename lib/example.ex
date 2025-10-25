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
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim()

    if String.to_integer(guess) == coreect do
      IO.puts("You win")
    else
      IO.puts("You loose!")
    end

    IO.puts("You guessed #{guess}, correct was #{coreect}")
  end
end
