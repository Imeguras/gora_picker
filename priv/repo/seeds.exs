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

#check if users already has users

defmodule Start_Seeding do
  defmodule Seeding_State do
    use Agent
    def start_link do
      Agent.start_link(fn -> %{} end)
    end
    def place_data(agent, key, value) do
      impr_data(agent, key, [value | get_data(agent, key)])
    end
    def impr_data(agent, key, value) do
      Agent.update(agent, fn state -> Map.put(state, key, value) end)
    end

    def get_data(agent, key) do
      Agent.get(agent, fn state -> Map.get(state, key) end)
    end
  end


  {:ok, agent_state} = Seeding_State.start_link()
  initializer = &(Seeding_State.impr_data(agent_state, &1, []))
  initializer.(:user_ids)
  initializer.(:package_ids)
  initializer.(:package_type_ids)
  initializer.(:manufacturer_ids)
  initializer.(:country_ids)

  if GoraPicker.Admin.list_users() != [] do
    IO.puts "Users already created"

  else
    pla = &(Seeding_State.place_data(agent_state, :user_ids, &1))
    {:ok, cs} =
      GoraPicker.Admin.create_user(%{
        "password" => "teste",
        "role" => "user",
        "name" => "ShawnBurnett",
        "email" => "ShawnBurnett@mail.com"
      })
    pla.(cs.id)
  end
    list_countries = GoraPicker.Origin.list_countries()
  if list_countries != [] do
    ids = Enum.map(list_comp, &(&1.id))
    IO.puts "Comp_package_types already created"
  end

    list_comp = GoraPicker.Features.list_comp_package_types()
    if list_comp != [] do
      #damn first timer, guess im not that bad in functional kek...
      ids = Enum.map(list_comp, &(&1.id))
      IO.puts "Comp_package_types already created"

    else
      pla = & (Seeding_State.place_data(agent_state, :package_type_ids, &1))
      {:ok, cs} =
        GoraPicker.Features.create_package__type(%{
          "name" => "Through Hole"
        })
        pla.(cs.id)

      {:ok, cs} =
        GoraPicker.Features.create_package__type(%{
          "name" => "Surface Mount"
        })
        pla.(cs.id)

      {:ok, cs} =
        GoraPicker.Features.create_package__type(%{
          "name" => "Other"
        })
        pla.(cs.id)
    end


  # map through data array and do (GoraPicker.Features.get_package__type!().name))) and replace id with name
  #
  #|> IO.inspect

  # TODO it has to be a single check...
  if GoraPicker.Features.list_comp_packages() != [] do
    IO.puts "Comp_packages already created"
  else

    data = Seeding_State.get_data(agent_state, :package_type_ids)
    |> Enum.with_index()


    fetcher = &(elem(List.keyfind(data, &1, 1),0))
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "SOT-23",
        "package__type_id" => fetcher.(1)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "SOT-223",
        "package__type_id" => fetcher.(1)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "SNSR",
        "package__type_id" => fetcher.(1)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "SO8",
        "package__type_id" => fetcher.(1)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "HVQFN36",
        "package__type_id" => fetcher.(1)
    })

    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "MELF",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "SOD",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "SOT",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-3",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-5",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-18",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-39",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-46",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-66",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-92",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-99",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-100",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-126",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-220",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-226",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-247",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-251",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-252",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-262",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-263",
        "package__type_id" => fetcher.(2)
    })
    {:ok, _cs} =
      GoraPicker.Features.create_package(%{
        "name" => "TO-274",
        "package__type_id" => fetcher.(2)
    })
  end
end
