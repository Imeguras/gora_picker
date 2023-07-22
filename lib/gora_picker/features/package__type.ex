defmodule GoraPicker.Features.Package_Type do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comp_package_types" do
    field :name, :string
    has_many :packages, GoraPicker.Features.Package
    timestamps()
  end

  @doc false
  def changeset(package__type, attrs) do
    package__type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> foreign_key_constraint(:packages)
  end
end
