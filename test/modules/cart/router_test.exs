defmodule ZiosPizza.Cart.RouterTest do
  use ExUnit.Case
  use Plug.Test
  use ZiosPizza.RepoCase

  test "POST /cart should return my cart" do
    conn =
      conn(:post, "/cart", %{pizza_id: 2})
      |> put_req_header("authorization", "Bearer USER_1")
      |> put_req_header("content-type", "application/json")
      |> ZiosPizza.Router.call(ZiosPizza.Router.init([]))

    assert conn.status == 201
    res = Jason.decode!(conn.resp_body)

    assert Enum.count(res["pizzas"]) == 1

    # %{
    #     user_id: "decode USER_1"
    #     pizzas: [{id:, _ name: _, price: _, qty: _}]
    #     total: _

    # }
  end
end
