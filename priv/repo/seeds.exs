# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GoraPicker.Repo.insert!(%GoraPicker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, _cs} =
  GoraPicker.Admin.create_user(%{
    "password" => "teste",
    "role" => "user",
    "name" => "ShawnBurnett",
    "email" => "ShawnBurnett@mail.com"
  })
