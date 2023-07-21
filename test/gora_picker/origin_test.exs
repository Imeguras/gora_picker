defmodule GoraPicker.OriginTest do
  use GoraPicker.DataCase

  alias GoraPicker.Origin

  describe "countries" do
    alias GoraPicker.Origin.Country

    import GoraPicker.OriginFixtures

    @invalid_attrs %{name: nil, location: nil, pri_abreviation: nil}

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Origin.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Origin.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      valid_attrs = %{name: "some name", location: "some location", pri_abreviation: "some pri_abreviation"}

      assert {:ok, %Country{} = country} = Origin.create_country(valid_attrs)
      assert country.name == "some name"
      assert country.location == "some location"
      assert country.pri_abreviation == "some pri_abreviation"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Origin.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      update_attrs = %{name: "some updated name", location: "some updated location", pri_abreviation: "some updated pri_abreviation"}

      assert {:ok, %Country{} = country} = Origin.update_country(country, update_attrs)
      assert country.name == "some updated name"
      assert country.location == "some updated location"
      assert country.pri_abreviation == "some updated pri_abreviation"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Origin.update_country(country, @invalid_attrs)
      assert country == Origin.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Origin.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Origin.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Origin.change_country(country)
    end
  end

  describe "manufacturers" do
    alias GoraPicker.Origin.Manufacturers

    import GoraPicker.OriginFixtures

    @invalid_attrs %{name: nil, pri_abreviation: nil, hq_location: nil}

    test "list_manufacturers/0 returns all manufacturers" do
      manufacturers = manufacturers_fixture()
      assert Origin.list_manufacturers() == [manufacturers]
    end

    test "get_manufacturers!/1 returns the manufacturers with given id" do
      manufacturers = manufacturers_fixture()
      assert Origin.get_manufacturers!(manufacturers.id) == manufacturers
    end

    test "create_manufacturers/1 with valid data creates a manufacturers" do
      valid_attrs = %{name: "some name", pri_abreviation: "some pri_abreviation", hq_location: "some hq_location"}

      assert {:ok, %Manufacturers{} = manufacturers} = Origin.create_manufacturers(valid_attrs)
      assert manufacturers.name == "some name"
      assert manufacturers.pri_abreviation == "some pri_abreviation"
      assert manufacturers.hq_location == "some hq_location"
    end

    test "create_manufacturers/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Origin.create_manufacturers(@invalid_attrs)
    end

    test "update_manufacturers/2 with valid data updates the manufacturers" do
      manufacturers = manufacturers_fixture()
      update_attrs = %{name: "some updated name", pri_abreviation: "some updated pri_abreviation", hq_location: "some updated hq_location"}

      assert {:ok, %Manufacturers{} = manufacturers} = Origin.update_manufacturers(manufacturers, update_attrs)
      assert manufacturers.name == "some updated name"
      assert manufacturers.pri_abreviation == "some updated pri_abreviation"
      assert manufacturers.hq_location == "some updated hq_location"
    end

    test "update_manufacturers/2 with invalid data returns error changeset" do
      manufacturers = manufacturers_fixture()
      assert {:error, %Ecto.Changeset{}} = Origin.update_manufacturers(manufacturers, @invalid_attrs)
      assert manufacturers == Origin.get_manufacturers!(manufacturers.id)
    end

    test "delete_manufacturers/1 deletes the manufacturers" do
      manufacturers = manufacturers_fixture()
      assert {:ok, %Manufacturers{}} = Origin.delete_manufacturers(manufacturers)
      assert_raise Ecto.NoResultsError, fn -> Origin.get_manufacturers!(manufacturers.id) end
    end

    test "change_manufacturers/1 returns a manufacturers changeset" do
      manufacturers = manufacturers_fixture()
      assert %Ecto.Changeset{} = Origin.change_manufacturers(manufacturers)
    end
  end
end
