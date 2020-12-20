defmodule Changkwang.Sermons.Sermon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sermons" do
    field :date, :string
    field :share_code, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(sermon, attrs) do
    sermon
    |> cast(attrs, [:title, :date, :share_code])
    |> validate_required([:title, :date, :share_code])
  end
end
