defmodule GoraPicker.FeaturesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GoraPicker.Features` context.
  """

  @doc """
  Generate a package__type.
  """
  def package__type_fixture(attrs \\ %{}) do
    {:ok, package__type} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GoraPicker.Features.create_package__type()

    package__type
  end

  @doc """
  Generate a package.
  """
  def package_fixture(attrs \\ %{}) do
    {:ok, package} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GoraPicker.Features.create_package()

    package
  end
end
