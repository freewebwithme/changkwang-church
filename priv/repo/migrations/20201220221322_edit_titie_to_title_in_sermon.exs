defmodule Changkwang.Repo.Migrations.EditTitieToTitleInSermon do
  use Ecto.Migration
  alias Changkwang.Sermons
  alias Changkwang.Sermons.Sermon

  def change do
    alter table("sermons") do
      add :title, :string
    end
  end
end
