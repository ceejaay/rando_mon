defmodule RandoMonWeb.PokemonController do
  use RandoMonWeb, :controller

  alias RandoMon.Account
  alias RandoMon.Account.Pokemon

  action_fallback RandoMonWeb.FallbackController

  def index(conn, _params) do
    pokemon = Account.list_pokemon()
    render(conn, "index.json", pokemon: pokemon)
  end

  def create(conn, %{"pokemon" => pokemon_params}) do
    with {:ok, %Pokemon{} = pokemon} <- Account.create_pokemon(pokemon_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pokemon_path(conn, :show, pokemon))
      |> render("show.json", pokemon: pokemon)
    end
  end

  def show(conn, %{"id" => id}) do
    pokemon = Account.get_pokemon!(id)
    render(conn, "show.json", pokemon: pokemon)
  end

  def update(conn, %{"id" => id, "pokemon" => pokemon_params}) do
    pokemon = Account.get_pokemon!(id)

    with {:ok, %Pokemon{} = pokemon} <- Account.update_pokemon(pokemon, pokemon_params) do
      render(conn, "show.json", pokemon: pokemon)
    end
  end

  def delete(conn, %{"id" => id}) do
    pokemon = Account.get_pokemon!(id)

    with {:ok, %Pokemon{}} <- Account.delete_pokemon(pokemon) do
      send_resp(conn, :no_content, "")
    end
  end
end
