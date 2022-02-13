defmodule Changkwang.Repo.Migrations.CreateSermons do
  use Ecto.Migration

  def change do
    create table(:sermons) do
      add :titie, :string
      add :date, :string
      add :share_code, :string

      timestamps()
    end

  end
end
