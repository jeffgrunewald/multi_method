defmodule MultiMethod.MixProject do
  use Mix.Project

  @version "0.1.0"
  @github "https://github.com/jeffgrunewald/multi_method"
  @description "Dynamically dispatch by data type based on arbitrary structure at runtime"

  def project do
    [
      app: :multi_method,
      name: "MultiMethod",
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: @description,
      package: package(),
      homepage: @github,
      docs: docs(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [plt_file: {:no_warn, ".dialyzer/#{System.version()}.plt"}]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.21.3", only: [:dev]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Jeff Grunewald"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @github}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      source_url: @github,
      extras: ["README.md"],
      source_url_pattern: "#{@github}/blob/master/%{path}#L%{line}"
    ]
  end
end
