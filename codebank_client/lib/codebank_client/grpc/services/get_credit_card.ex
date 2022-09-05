defmodule CodebankClient.Grpc.Services.GetCreditCard do
  import Logger

  alias CreditCard.CreditCard
  alias CodebankClient.Grpc.Client

  def execute(number) do
    Logger.info("Get credit card by #{number} on credit_card microsservice")

    number
    |> Client.get_credit_card()
    |> handle_response()
  end

  def handle_response({:ok, credit_card}) do
    {:ok, CreditCard.new(credit_card)}
  end

  def handle_response(error) do
    error
  end
end
