defmodule Changkwang.Sermon2 do
  use Ecto.Schema
  import Ecto.Changeset

  alias Changkwang.{Sermon2, Repo}

  schema "sermons" do
    field :title, :string
    field :date, :string
    field :youtube_share_link, :string
  end

  @doc false
  def changeset(%Sermon2{} = sermon, attrs) do
    sermon
    |> cast(attrs, [:title, :date, :youtube_share_link])
    |> validate_required([:title, :date, :youtube_share_link])
  end

  def create_sermon(attrs) do
    %Sermon2{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def update_sermon(%Sermon2{} = sermon, attrs) do
    sermon
    |> changeset(attrs)
    |> Repo.update()
  end

  def delete_sermon(%Sermon2{} = sermon) do
    sermon
    |> Repo.delete!()
  end
end
