defmodule GoraPicker.Origin do
  @moduledoc """
  The Origin context.
  """

  import Ecto.Query, warn: false
  alias GoraPicker.Repo

  alias GoraPicker.Origin.Country

  @doc """
  Returns the list of countries.

  ## Examples

      iex> list_countries()
      [%Country{}, ...]

  """
  def list_countries do
    Repo.all(Country)
  end

  @doc """
  Gets a single country.

  Raises `Ecto.NoResultsError` if the Country does not exist.

  ## Examples

      iex> get_country!(123)
      %Country{}

      iex> get_country!(456)
      ** (Ecto.NoResultsError)

  """
  def get_country!(id), do: Repo.get!(Country, id)

  @doc """
  Creates a country.

  ## Examples

      iex> create_country(%{field: value})
      {:ok, %Country{}}

      iex> create_country(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_country(attrs \\ %{}) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a country.

  ## Examples

      iex> update_country(country, %{field: new_value})
      {:ok, %Country{}}

      iex> update_country(country, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_country(%Country{} = country, attrs) do
    country
    |> Country.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a country.

  ## Examples

      iex> delete_country(country)
      {:ok, %Country{}}

      iex> delete_country(country)
      {:error, %Ecto.Changeset{}}

  """
  def delete_country(%Country{} = country) do
    Repo.delete(country)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking country changes.

  ## Examples

      iex> change_country(country)
      %Ecto.Changeset{data: %Country{}}

  """
  def change_country(%Country{} = country, attrs \\ %{}) do
    Country.changeset(country, attrs)
  end

  alias GoraPicker.Origin.Manufacturers

  @doc """
  Returns the list of manufacturers.

  ## Examples

      iex> list_manufacturers()
      [%Manufacturers{}, ...]

  """
  def list_manufacturers do
    Repo.all(Manufacturers)
  end

  @doc """
  Gets a single manufacturers.

  Raises `Ecto.NoResultsError` if the Manufacturers does not exist.

  ## Examples

      iex> get_manufacturers!(123)
      %Manufacturers{}

      iex> get_manufacturers!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manufacturers!(id), do: Repo.get!(Manufacturers, id)

  @doc """
  Creates a manufacturers.

  ## Examples

      iex> create_manufacturers(%{field: value})
      {:ok, %Manufacturers{}}

      iex> create_manufacturers(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manufacturers(attrs \\ %{}) do
    %Manufacturers{}
    |> Manufacturers.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manufacturers.

  ## Examples

      iex> update_manufacturers(manufacturers, %{field: new_value})
      {:ok, %Manufacturers{}}

      iex> update_manufacturers(manufacturers, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_manufacturers(%Manufacturers{} = manufacturers, attrs) do
    manufacturers
    |> Manufacturers.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a manufacturers.

  ## Examples

      iex> delete_manufacturers(manufacturers)
      {:ok, %Manufacturers{}}

      iex> delete_manufacturers(manufacturers)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manufacturers(%Manufacturers{} = manufacturers) do
    Repo.delete(manufacturers)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manufacturers changes.

  ## Examples

      iex> change_manufacturers(manufacturers)
      %Ecto.Changeset{data: %Manufacturers{}}

  """
  def change_manufacturers(%Manufacturers{} = manufacturers, attrs \\ %{}) do
    Manufacturers.changeset(manufacturers, attrs)
  end
end
