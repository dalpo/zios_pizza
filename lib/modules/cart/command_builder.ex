defmodule ZiosPizza.Cart.CommandBuilder do
  @schema %{
    "type" => "object",
    "properties" => %{
      "pizza_id" => %{"type" => "number"}
    },
    "required" => ["pizza_id"]
  }

  def build_add_pizza(payload) do
    # validazione payload
    # costruzione comando
    # TODO: verificare esistenza di PizzaId
    if ExJsonSchema.Validator.valid?(@schema, payload) do
      {:add_pizza, %{pizza_id: payload["pizza_id"]}}
    else
      {:error, "payload malformato"}
    end
  end
end
