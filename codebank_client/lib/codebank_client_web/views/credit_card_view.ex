defmodule CodebankClientWeb.CreditCardView do
  use CodebankClientWeb, :view

  def render("show.json", %{credit_card: credit_card}),
    do: %{
      id: credit_card.id,
      name: credit_card.name,
      number: credit_card.number,
      expiration_month: credit_card.expirationMonth,
      expiration_year: credit_card.expirationYear,
      cvv: credit_card.cvv,
      balance: credit_card.balance,
      limit: credit_card.limit
    }
end
