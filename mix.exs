defmodule Synapse.MixProject do
  use Mix.Project

  def project do
    [
      app: :synapse,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env)
    ]
  end

  def application do
    [
      mod: {Synapse, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:elixir_ale, "~> 1.0"}
    ]
  end

  defp elixirc_paths(:test), do: ["synapse.ex", "synapse", "test"]
  defp elixirc_paths(_), do: ["synapse.ex", "synapse"]
end
