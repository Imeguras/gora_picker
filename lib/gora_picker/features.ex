defmodule GoraPicker.Features do
  @moduledoc """
  The Features context.
  """

  import Ecto.Query, warn: false
  alias GoraPicker.Repo

  alias GoraPicker.Features.Package_Type

  @doc """
  Returns the list of comp_package_types.

  ## Examples

      iex> list_comp_package_types()
      [%Package_Type{}, ...]

  """
  def list_comp_package_types do
    Repo.all(Package_Type)
  end

  @doc """
  Gets a single package__type.

  Raises `Ecto.NoResultsError` if the Package  type does not exist.

  ## Examples

      iex> get_package__type!(123)
      %Package_Type{}

      iex> get_package__type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package__type!(id), do: Repo.get!(Package_Type, id)

  @doc """
  Creates a package__type.

  ## Examples

      iex> create_package__type(%{field: value})
      {:ok, %Package_Type{}}

      iex> create_package__type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_package__type(attrs \\ %{}) do
    %Package_Type{}
    |> Package_Type.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a package__type.

  ## Examples

      iex> update_package__type(package__type, %{field: new_value})
      {:ok, %Package_Type{}}

      iex> update_package__type(package__type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_package__type(%Package_Type{} = package__type, attrs) do
    package__type
    |> Package_Type.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a package__type.

  ## Examples

      iex> delete_package__type(package__type)
      {:ok, %Package_Type{}}

      iex> delete_package__type(package__type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_package__type(%Package_Type{} = package__type) do

    Repo.delete(package__type)

  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking package__type changes.

  ## Examples

      iex> change_package__type(package__type)
      %Ecto.Changeset{data: %Package_Type{}}

  """
  def change_package__type(%Package_Type{} = package__type, attrs \\ %{}) do
    Package_Type.changeset(package__type, attrs)
  end

  alias GoraPicker.Features.Package

  @doc """
  Returns the list of comp_packages.

  ## Examples

      iex> list_comp_packages()
      [%Package{}, ...]

  """
  def list_comp_packages do
    Repo.all(Package)
  end

  @doc """
  Gets a single package.

  Raises `Ecto.NoResultsError` if the Package does not exist.

  ## Examples

      iex> get_package!(123)
      %Package{}

      iex> get_package!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package!(id), do: Repo.get!(Package, id)

  @doc """
  Creates a package.

  ## Examples

      iex> create_package(%{field: value})
      {:ok, %Package{}}

      iex> create_package(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_package(attrs \\ %{}) do

    #_fetch_default = Repo.find(Package_Type, %{"name" => "Other"})
    package__type_ref = attrs["package__type_id"]
    |> (&(Repo.get(Package_Type, &1))).()
    |> IO.inspect
          #|| Repo.find(Package_Type, %{"name" => "Other"})
          #|| throw(%{message: "Package Type missing, failed to set it to a default value."})

    #%Package{}
    #|> Package.changeset(attrs)
    #|> ChangeSet.put_assoc(:package__type, package__type_ref)
    #|> Repo.insert()
  end

  @doc """
  Updates a package.

  ## Examples

      iex> update_package(package, %{field: new_value})
      {:ok, %Package{}}

      iex> update_package(package, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_package(%Package{} = package, attrs) do
    package
    |> Package.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a package.

  ## Examples

      iex> delete_package(package)
      {:ok, %Package{}}

      iex> delete_package(package)
      {:error, %Ecto.Changeset{}}

  """
  def delete_package(%Package{} = package) do
    Repo.delete(package)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking package changes.

  ## Examples

      iex> change_package(package)
      %Ecto.Changeset{data: %Package{}}

  """
  def change_package(%Package{} = package, attrs \\ %{}) do
    Package.changeset(package, attrs)
  end
end
