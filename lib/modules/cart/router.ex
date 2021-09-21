defmodule ZiosPizza.Cart.Router do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(ZiosPizza.Plug.Auth)

  plug(:match)
  plug(:dispatch)

  post "/" do
    # {"pizza_id": 42}
    user_id = conn.assigns[:user]

    case CommandBuilder.build_add_pizza(conn.body_params) do
      {:ok, cmd} ->
        Gateway.execute(user_id, cmd)

      {:error, errors} ->
        send_resp(conn, 400, errors)
    end

    send_resp(conn, 201, Jason.encode!(%{pizzas: []}))
  end
end
