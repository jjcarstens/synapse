defmodule Synapse do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: Synapse.Supervisor},
      {Registry, keys: :unique, name: Registry.GPIO}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def gpio_via(gpio), do: {:via, Registry, {Registry.GPIO, gpio}}
end
