defmodule CodebankClient.Repo do
  use Ecto.Repo,
    otp_app: :codebank_client,
    adapter: Ecto.Adapters.Postgres
end
