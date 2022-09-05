%{
  name: "Bruno",
  number: "12345678900",
  expiration_month: "05",
  expiration_year: "23",
  cvv: 555,
  balance: 1000,
  limit: 2000
}
|> Codebank.Schemas.CreditCard.changeset()
|> Codebank.Repo.insert!()
