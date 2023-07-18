defmodule GoraPicker.Repo do
  use Ecto.Repo,
    otp_app: :gora_picker,
    adapter: Ecto.Adapters.Postgres
end
