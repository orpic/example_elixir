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
    correct = :rand.uniform(11) - 1
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      {result, _} ->
        if result === correct do
          IO.puts("Your win")
        else
          IO.puts("You logse")
        end

      :error ->
        IO.puts("something went wrong")
    end
  end
end
