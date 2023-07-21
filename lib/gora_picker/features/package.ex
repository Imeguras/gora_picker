defmodule GoraPicker.Features.Package do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comp_packages" do
    field :name, :string
    belongs_to :package__type, GoraPicker.Features.Package_Type
    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:name, :package__type])
    |> validate_required([:name])
    |> foreign_key_constraint(:package__type)
  end
end
