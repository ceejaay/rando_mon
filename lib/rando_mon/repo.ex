defmodule RandoMon.Repo do
  use Ecto.Repo,
    otp_app: :rando_mon,
    adapter: Ecto.Adapters.Postgres
end
