defmodule Changkwang.Sermons do
  @moduledoc """
  The Sermons context.
  """

  import Ecto.Query, warn: false
  alias Changkwang.Repo

  alias Changkwang.Sermons.Sermon

  @doc """
  Returns the list of sermons.

  ## Examples

      iex> list_sermons()
      [%Sermon{}, ...]

  """
  def list_sermons do
    query = from s in Sermon, order_by: [desc: s.inserted_at], limit: 10
    Repo.all(query)
  end

  @doc """
  Gets a single sermon.

  Raises `Ecto.NoResultsError` if the Sermon does not exist.

  ## Examples

      iex> get_sermon!(123)
      %Sermon{}

      iex> get_sermon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sermon!(id), do: Repo.get!(Sermon, id)

  @doc """
  Creates a sermon.

  ## Examples

      iex> create_sermon(%{field: value})
      {:ok, %Sermon{}}

      iex> create_sermon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sermon(attrs \\ %{}) do
    %Sermon{}
    |> Sermon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sermon.

  ## Examples

      iex> update_sermon(sermon, %{field: new_value})
      {:ok, %Sermon{}}

      iex> update_sermon(sermon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sermon(%Sermon{} = sermon, attrs) do
    sermon
    |> Sermon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sermon.

  ## Examples

      iex> delete_sermon(sermon)
      {:ok, %Sermon{}}

      iex> delete_sermon(sermon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sermon(%Sermon{} = sermon) do
    Repo.delete(sermon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sermon changes.

  ## Examples

      iex> change_sermon(sermon)
      %Ecto.Changeset{data: %Sermon{}}

  """
  def change_sermon(%Sermon{} = sermon, attrs \\ %{}) do
    Sermon.changeset(sermon, attrs)
  end
end
