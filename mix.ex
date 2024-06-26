defmodule DecentralizedProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :decentralized_project,
      version: "0.1.0",
      elixir: "~> 1.0",
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
    []
  end
end
