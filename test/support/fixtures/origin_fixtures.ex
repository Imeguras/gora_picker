defmodule GoraPicker.OriginFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GoraPicker.Origin` context.
  """

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        name: "some name",
        location: "some location",
        pri_abreviation: "some pri_abreviation"
      })
      |> GoraPicker.Origin.create_country()

    country
  end

  @doc """
  Generate a manufacturers.
  """
  def manufacturers_fixture(attrs \\ %{}) do
    {:ok, manufacturers} =
      attrs
      |> Enum.into(%{
        name: "some name",
        pri_abreviation: "some pri_abreviation",
        hq_location: "some hq_location"
      })
      |> GoraPicker.Origin.create_manufacturers()

    manufacturers
  end
end
