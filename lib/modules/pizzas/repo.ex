defmodule ZiosPizza.Pizzas.Repo do
  alias ZiosPizza.Pizzas.Schema
  alias ZiosPizza.Utils.Functions

  def get_all do
    ZiosPizza.Repo.all(Schema)
    |> Enum.map(&Functions.serialize_to_map/1)
  end
end
