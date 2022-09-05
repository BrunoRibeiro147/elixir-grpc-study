defmodule CodebankClientWeb.CreditCardController do
  use CodebankClientWeb, :controller

  alias CodebankClient.Grpc.Services.GetCreditCard

  # action_fallback CodebankClientWeb.FallbackController

  def show(conn, %{"number" => number}) do
    with {:ok, credit_card} <- GetCreditCard.execute(number) do
      conn
      |> put_status(:ok)
      |> render("show.json", credit_card: credit_card)
    end
  end
end
