defmodule RandoMon.Account.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pokemon" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
