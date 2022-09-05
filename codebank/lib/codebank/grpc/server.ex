defmodule Codebank.GRPC.Server do
  use GRPC.Server, service: CreditCard.CreditCardService.Service

  alias CreditCard.GetCreditCardRequest
  alias CreditCard.GetCreditCardResponse
  alias CreditCard.CreditCard
  alias Codebank.Schemas

  require Logger

  def get(%GetCreditCardRequest{number: number}, _stream) do
    build_response(Codebank.Repo.get_by(Schemas.CreditCard, number: number))
  end

  def build_response(%Schemas.CreditCard{} = credit_card) do
    credit_card_map = %{
      id: credit_card.id,
      name: credit_card.name,
      number: credit_card.number,
      expiration_month: credit_card.expiration_month,
      expiration_year: credit_card.expiration_year,
      cvv: credit_card.cvv,
      balance: credit_card.balance,
      limit: credit_card.limit
    }

    GetCreditCardResponse.new(creditCard: CreditCard.new(credit_card_map))
  end

  def build_response(nil) do
    Logger.info("Credit Card not found")

    raise GRPC.RPCError, status: :not_found
  end
end
