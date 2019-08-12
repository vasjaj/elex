defmodule Elex.Repo do
  use Ecto.Repo,
    otp_app: :elex,
    adapter: Ecto.Adapters.Postgres
end
