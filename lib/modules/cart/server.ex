defmodule ZiosPizza.Cart.Server do
  use GenServer

  def handle_call({:add_pizza, payload}, _from, state) do
    #  ...
  end
end
