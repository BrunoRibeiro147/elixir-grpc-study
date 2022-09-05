defmodule Codebank.Repo.Migrations.CreateCreditCardTable do
  use Ecto.Migration

  def change do
    create table(:credit_cards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :number, :string
      add :expiration_month, :integer
      add :expiration_year, :integer
      add :cvv, :integer
      add :balance, :float
      add :limit, :float

      timestamps(type: :utc_datetime_usec)
    end
  end
end
