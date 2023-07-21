defmodule GoraPicker.FeaturesTest do
  use GoraPicker.DataCase

  alias GoraPicker.Features

  describe "comp_package_types" do
    alias GoraPicker.Features.Package_Type

    import GoraPicker.FeaturesFixtures

    @invalid_attrs %{name: nil}

    test "list_comp_package_types/0 returns all comp_package_types" do
      package__type = package__type_fixture()
      assert Features.list_comp_package_types() == [package__type]
    end

    test "get_package__type!/1 returns the package__type with given id" do
      package__type = package__type_fixture()
      assert Features.get_package__type!(package__type.id) == package__type
    end

    test "create_package__type/1 with valid data creates a package__type" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Package_Type{} = package__type} = Features.create_package__type(valid_attrs)
      assert package__type.name == "some name"
    end

    test "create_package__type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Features.create_package__type(@invalid_attrs)
    end

    test "update_package__type/2 with valid data updates the package__type" do
      package__type = package__type_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Package_Type{} = package__type} = Features.update_package__type(package__type, update_attrs)
      assert package__type.name == "some updated name"
    end

    test "update_package__type/2 with invalid data returns error changeset" do
      package__type = package__type_fixture()
      assert {:error, %Ecto.Changeset{}} = Features.update_package__type(package__type, @invalid_attrs)
      assert package__type == Features.get_package__type!(package__type.id)
    end

    test "delete_package__type/1 deletes the package__type" do
      package__type = package__type_fixture()
      assert {:ok, %Package_Type{}} = Features.delete_package__type(package__type)
      assert_raise Ecto.NoResultsError, fn -> Features.get_package__type!(package__type.id) end
    end

    test "change_package__type/1 returns a package__type changeset" do
      package__type = package__type_fixture()
      assert %Ecto.Changeset{} = Features.change_package__type(package__type)
    end
  end

  describe "comp_packages" do
    alias GoraPicker.Features.Package

    import GoraPicker.FeaturesFixtures

    @invalid_attrs %{name: nil}

    test "list_comp_packages/0 returns all comp_packages" do
      package = package_fixture()
      assert Features.list_comp_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Features.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Package{} = package} = Features.create_package(valid_attrs)
      assert package.name == "some name"
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Features.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Package{} = package} = Features.update_package(package, update_attrs)
      assert package.name == "some updated name"
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Features.update_package(package, @invalid_attrs)
      assert package == Features.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Features.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Features.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Features.change_package(package)
    end
  end
end
