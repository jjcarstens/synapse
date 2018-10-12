defmodule Synapse.MixProject do
  use Mix.Project

  def project do
    [
      app: :synapse,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:elixir_ale, "~> 1.0"}
    ]
  end
end
