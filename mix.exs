defmodule GcStorage.Mixfile do
  use Mix.Project

  def project do
    [app: :gc_storage,
     description: "Elixir wrapper for Google Cloud Storage Wrapper",
     version: "0.2.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :goth]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:goth, "~> 0.2.1"}, {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Ping"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/seymores/gc_storage"}
    ]
  end

end
