defmodule TwelveDaysApi.UsersTest do
  use TwelveDaysApi.DataCase

  alias TwelveDaysApi.Users

  describe "users" do
    alias TwelveDaysApi.Users.User

    @valid_attrs %{email: "some email", field: "some field", first_name: "some first_name", last_name: "some last_name", latest_activity: ~N[2010-04-17 14:00:00], password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", field: "some updated field", first_name: "some updated first_name", last_name: "some updated last_name", latest_activity: ~N[2011-05-18 15:01:01], password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, field: nil, first_name: nil, last_name: nil, latest_activity: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.field == "some field"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.latest_activity == ~N[2010-04-17 14:00:00]
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.field == "some updated field"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.latest_activity == ~N[2011-05-18 15:01:01]
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
