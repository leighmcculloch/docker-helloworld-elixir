defmodule Helloworld.Mixfile do
  use Mix.Project

  def project do
    [app: :helloworld,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: Helloworld, app: :helloworld],
     deps: deps]
  end

  def application do
    [applications: [:cowboy],
     mod: {Helloworld, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"}]
  end
end
