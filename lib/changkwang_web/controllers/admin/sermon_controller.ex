defmodule ChangkwangWeb.Admin.SermonController do
  use ChangkwangWeb, :controller

  alias Changkwang.Sermons
  alias Changkwang.Sermons.Sermon

  def index(conn, _params) do
    sermons = Sermons.list_sermons()
    render(conn, "index.html", sermons: sermons)
  end

  def new(conn, _params) do
    changeset = Sermons.change_sermon(%Sermon{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sermon" => sermon_params}) do
    case Sermons.create_sermon(sermon_params) do
      {:ok, sermon} ->
        conn
        |> put_flash(:info, "Sermon created successfully.")
        |> redirect(to: Routes.sermon_path(conn, :show, sermon))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sermon = Sermons.get_sermon!(id)
    render(conn, "show.html", sermon: sermon)
  end

  def edit(conn, %{"id" => id}) do
    sermon = Sermons.get_sermon!(id)
    changeset = Sermons.change_sermon(sermon)
    render(conn, "edit.html", sermon: sermon, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sermon" => sermon_params}) do
    sermon = Sermons.get_sermon!(id)

    case Sermons.update_sermon(sermon, sermon_params) do
      {:ok, sermon} ->
        conn
        |> put_flash(:info, "Sermon updated successfully.")
        |> redirect(to: Routes.sermon_path(conn, :show, sermon))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sermon: sermon, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sermon = Sermons.get_sermon!(id)
    {:ok, _sermon} = Sermons.delete_sermon(sermon)

    conn
    |> put_flash(:info, "Sermon deleted successfully.")
    |> redirect(to: Routes.sermon_path(conn, :index))
  end
end
