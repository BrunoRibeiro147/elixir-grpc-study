defmodule CodebankClient.Grpc.Client do
  alias CreditCard.CreditCardService.Stub

  alias CreditCard.GetCreditCardRequest
  alias CreditCard.GetCreditCardResponse
  alias CreditCard.CreditCard

  @credit_card_service_url "localhost:50051"

  def get_credit_card(number) do
    with {:ok, channel} <- GRPC.Stub.connect(@credit_card_service_url),
         {:ok, %GetCreditCardRequest{} = request} <- build_request(number),
         {:ok, %GetCreditCardResponse{creditCard: credit_card}} <-
           Stub.get(channel, request),
         do: build_response(credit_card)
  end

  def build_request(number), do: {:ok, GetCreditCardRequest.new(number: number)}

  def build_response(%CreditCard{} = credit_card) do
    credit_card_map = %{
      id: credit_card.id,
      name: credit_card.name,
      number: credit_card.number,
      expiration_month: credit_card.expirationMonth,
      expiration_year: credit_card.expirationYear,
      cvv: credit_card.cvv,
      balance: credit_card.balance,
      limit: credit_card.limit
    }

    {:ok, credit_card_map}
  end
end
