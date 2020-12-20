defmodule ChangkwangWeb.SermonControllerTest do
  use ChangkwangWeb.ConnCase

  alias Changkwang.Sermons

  @create_attrs %{date: "some date", share_code: "some share_code", titie: "some titie"}
  @update_attrs %{date: "some updated date", share_code: "some updated share_code", titie: "some updated titie"}
  @invalid_attrs %{date: nil, share_code: nil, titie: nil}

  def fixture(:sermon) do
    {:ok, sermon} = Sermons.create_sermon(@create_attrs)
    sermon
  end

  describe "index" do
    test "lists all sermons", %{conn: conn} do
      conn = get(conn, Routes.sermon_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sermons"
    end
  end

  describe "new sermon" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sermon_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sermon"
    end
  end

  describe "create sermon" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sermon_path(conn, :create), sermon: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sermon_path(conn, :show, id)

      conn = get(conn, Routes.sermon_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sermon"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sermon_path(conn, :create), sermon: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sermon"
    end
  end

  describe "edit sermon" do
    setup [:create_sermon]

    test "renders form for editing chosen sermon", %{conn: conn, sermon: sermon} do
      conn = get(conn, Routes.sermon_path(conn, :edit, sermon))
      assert html_response(conn, 200) =~ "Edit Sermon"
    end
  end

  describe "update sermon" do
    setup [:create_sermon]

    test "redirects when data is valid", %{conn: conn, sermon: sermon} do
      conn = put(conn, Routes.sermon_path(conn, :update, sermon), sermon: @update_attrs)
      assert redirected_to(conn) == Routes.sermon_path(conn, :show, sermon)

      conn = get(conn, Routes.sermon_path(conn, :show, sermon))
      assert html_response(conn, 200) =~ "some updated date"
    end

    test "renders errors when data is invalid", %{conn: conn, sermon: sermon} do
      conn = put(conn, Routes.sermon_path(conn, :update, sermon), sermon: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sermon"
    end
  end

  describe "delete sermon" do
    setup [:create_sermon]

    test "deletes chosen sermon", %{conn: conn, sermon: sermon} do
      conn = delete(conn, Routes.sermon_path(conn, :delete, sermon))
      assert redirected_to(conn) == Routes.sermon_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sermon_path(conn, :show, sermon))
      end
    end
  end

  defp create_sermon(_) do
    sermon = fixture(:sermon)
    %{sermon: sermon}
  end
end
