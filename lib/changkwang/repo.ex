defmodule Changkwang.Repo do
  use Ecto.Repo,
    otp_app: :changkwang,
    adapter: Ecto.Adapters.Postgres
end
