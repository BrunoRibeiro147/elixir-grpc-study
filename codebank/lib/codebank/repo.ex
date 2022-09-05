defmodule Codebank.Repo do
  use Ecto.Repo,
    otp_app: :codebank,
    adapter: Ecto.Adapters.Postgres
end
