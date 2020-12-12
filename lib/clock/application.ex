defmodule Clock.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: Clock.Supervisor]

    children =
      [
         {Clock.Server, Application.get_all_env(:clock)}
      ] ++ children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: Clock.Worker.start_link(arg)
      # {Clock.Worker, arg},
    ]
  end

  def children(_target) do
    [
      # Children for all targets except host
      # Starts a worker by calling: Clock.Worker.start_link(arg)
      # {Clock.Worker, arg},
    ]
  end

  def target() do
    Application.get_env(:clock, :target)
  end
end
