defmodule GoraPicker.Origin.Country do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "countries" do
    field :name, :string
    field :location, :string
    field :pri_abreviation, :string
    has_many :manufacturers, GoraPicker.Origin.Manufacturers
    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :pri_abreviation, :location])
    |> validate_required([:name, :pri_abreviation, :location])
  end
end
