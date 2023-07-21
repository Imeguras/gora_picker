defmodule GoraPicker.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset
  @acceptable_roles ["admin", "user"]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :role, :string, default: "user"
    field :email, :string
    field :password_hash, :string
    timestamps()
  end
  def get_acceptable_roles, do: @acceptable_roles

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :role])
    |> validate_required([:name, :email, :role])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:role, @acceptable_roles)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

end
