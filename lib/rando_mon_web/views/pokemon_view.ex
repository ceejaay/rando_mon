defmodule RandoMonWeb.PokemonView do
  use RandoMonWeb, :view
  alias RandoMonWeb.PokemonView

  def render("index.json", %{pokemon: pokemon}) do
    %{data: render_many(pokemon, PokemonView, "pokemon.json")}
  end

  def render("show.json", %{pokemon: pokemon}) do
    %{data: render_one(pokemon, PokemonView, "pokemon.json")}
  end

  def render("pokemon.json", %{pokemon: pokemon}) do
    %{
      id: pokemon.id,
      name: pokemon.name
    }
  end
end
