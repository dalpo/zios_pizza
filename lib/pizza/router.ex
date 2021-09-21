defmodule ZiosPizza.Pizza.Router do
  use Plug.Router
  alias ZiosPizza.Pizza.Repo

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    search = Map.get(conn.query_params, "search")

    pizzas =
      Repo.get_all()
      |> filter(search)
      |> map_pizza()
      |> Jason.encode!()

    send_resp(conn, 200, pizzas)
  end

  def filter(pizzas, nil), do: pizzas

  def filter(pizzas, search_term) do
    Enum.filter(pizzas, fn p ->
      p.name
      |> String.downcase()
      |> String.contains?(search_term)
    end)
  end

  def map_pizza(pizzas) do
    Enum.map(pizzas, fn p ->
      %{id: p.id, name: p.name, price: p.price}
    end)
  end
end
