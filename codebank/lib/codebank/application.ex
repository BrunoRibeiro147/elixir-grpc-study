defmodule Codebank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Codebank.Repo,
      # Start the Telemetry supervisor
      CodebankWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Codebank.PubSub},
      # Start the Endpoint (http/https)
      CodebankWeb.Endpoint,
      # Start the GRPC Endpoint,
      {GRPC.Server.Supervisor, {Codebank.GRPC.Server, 50051}}
      # Start a worker by calling: Codebank.Worker.start_link(arg)
      # {Codebank.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Codebank.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CodebankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
