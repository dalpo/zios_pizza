defmodule ZiosPizza.Cart.Gateway do
  use DynamicSupervisor

  def execute(user_id, cmd) do
    # se esiste l'attore cart per lo user_id
    #  passa il comando all'attore
    # else
    #  crea l'attore per lo user_id
    #  passa il comando all'attore
  end
end
