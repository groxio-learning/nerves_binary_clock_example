defmodule Clock.Application do
  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: Clock.Supervisor]
    Supervisor.start_link(children(target(), env()), opts)
  end

  # all test processes to be supervised
  def children(_target, :test) do
    []
  end
  
  # all dev processes to be supervised
  def children(_target, _other) do
    [{Clock.Server, Application.get_all_env(:clock)}]
  end

  def target() do
    Application.get_env(:clock, :target)
  end
  
  def env() do
    Application.get_env(:clock, :env)
  end
end
