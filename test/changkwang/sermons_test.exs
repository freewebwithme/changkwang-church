defmodule Changkwang.SermonsTest do
  use Changkwang.DataCase

  alias Changkwang.Sermons

  describe "sermons" do
    alias Changkwang.Sermons.Sermon

    @valid_attrs %{date: "some date", share_code: "some share_code", titie: "some titie"}
    @update_attrs %{date: "some updated date", share_code: "some updated share_code", titie: "some updated titie"}
    @invalid_attrs %{date: nil, share_code: nil, titie: nil}

    def sermon_fixture(attrs \\ %{}) do
      {:ok, sermon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sermons.create_sermon()

      sermon
    end

    test "list_sermons/0 returns all sermons" do
      sermon = sermon_fixture()
      assert Sermons.list_sermons() == [sermon]
    end

    test "get_sermon!/1 returns the sermon with given id" do
      sermon = sermon_fixture()
      assert Sermons.get_sermon!(sermon.id) == sermon
    end

    test "create_sermon/1 with valid data creates a sermon" do
      assert {:ok, %Sermon{} = sermon} = Sermons.create_sermon(@valid_attrs)
      assert sermon.date == "some date"
      assert sermon.share_code == "some share_code"
      assert sermon.titie == "some titie"
    end

    test "create_sermon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sermons.create_sermon(@invalid_attrs)
    end

    test "update_sermon/2 with valid data updates the sermon" do
      sermon = sermon_fixture()
      assert {:ok, %Sermon{} = sermon} = Sermons.update_sermon(sermon, @update_attrs)
      assert sermon.date == "some updated date"
      assert sermon.share_code == "some updated share_code"
      assert sermon.titie == "some updated titie"
    end

    test "update_sermon/2 with invalid data returns error changeset" do
      sermon = sermon_fixture()
      assert {:error, %Ecto.Changeset{}} = Sermons.update_sermon(sermon, @invalid_attrs)
      assert sermon == Sermons.get_sermon!(sermon.id)
    end

    test "delete_sermon/1 deletes the sermon" do
      sermon = sermon_fixture()
      assert {:ok, %Sermon{}} = Sermons.delete_sermon(sermon)
      assert_raise Ecto.NoResultsError, fn -> Sermons.get_sermon!(sermon.id) end
    end

    test "change_sermon/1 returns a sermon changeset" do
      sermon = sermon_fixture()
      assert %Ecto.Changeset{} = Sermons.change_sermon(sermon)
    end
  end
end
