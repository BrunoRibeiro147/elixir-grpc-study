defmodule CreditCard.GetCreditCardRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :number, 1, type: :string
end

defmodule CreditCard.GetCreditCardResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :creditCard, 1, type: CreditCard.CreditCard
end

defmodule CreditCard.CreditCard do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :number, 3, type: :string
  field :expirationMonth, 4, type: :int32
  field :expirationYear, 5, type: :int32
  field :cvv, 6, type: :int32
  field :balance, 7, type: :float
  field :limit, 8, type: :float
end

defmodule CreditCard.CreditCardService.Service do
  @moduledoc false
  use GRPC.Service, name: "credit_card.CreditCardService", protoc_gen_elixir_version: "0.11.0"

  rpc :Get, CreditCard.GetCreditCardRequest, CreditCard.GetCreditCardResponse
end

defmodule CreditCard.CreditCardService.Stub do
  @moduledoc false
  use GRPC.Stub, service: CreditCard.CreditCardService.Service
end