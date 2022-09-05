defmodule Codebank.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run(Codebank.GRPC.Server)
end
