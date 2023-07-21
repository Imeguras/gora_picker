defmodule GoraPicker.Origin.Manufacturers do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "manufacturers" do
    field :name, :string
    field :pri_abreviation, :string
    field :hq_location, :string
    # add country as a foreign key
    belongs_to :country, GoraPicker.Origin.Country
    timestamps()
  end

  @doc false
  def changeset(manufacturers, attrs) do
    manufacturers
    |> cast(attrs, [:name, :pri_abreviation, :hq_location])
    |> validate_required([:name, :pri_abreviation, :hq_location])
    |> foreign_key_constraint(:country)
  end
end
