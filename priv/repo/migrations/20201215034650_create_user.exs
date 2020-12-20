defmodule Changkwang.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION citext", "DROP EXTENSION citext")

    create table("users") do
      add :email, :string
      add :hashed_password, :string
      add :admin, :boolean, default: false

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
