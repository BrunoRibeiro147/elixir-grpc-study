defmodule Codebank.Schemas.CreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @timestamps_opts [type: :utc_datetime_usec]

  @fields [:name, :number, :expiration_month, :expiration_year, :cvv, :balance, :limit]

  schema "credit_cards" do
    field :name, :string
    field :number, :string
    field :expiration_month, :integer
    field :expiration_year, :integer
    field :cvv, :integer
    field :balance, :float
    field :limit, :float

    timestamps()
  end

  def changeset(schema \\ %__MODULE__{}, params) do
    schema
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
