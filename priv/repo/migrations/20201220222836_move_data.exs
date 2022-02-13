defmodule Changkwang.Repo.Migrations.MoveData do
  use Ecto.Migration
  alias Changkwang.{Sermons, Repo}
  alias Changkwang.Sermons.Sermon

  def change do
    # get title value
    sermons = Sermons.list_sermons()

    Enum.map(sermons, fn sermon ->
      sermon
      |> Sermon.changeset(%{title: sermon.titie})
      |> Repo.update()
    end)

    alter table("sermons") do
      remove :titie, :string
    end
  end
end
