defmodule RandoMon.AccountTest do
  use RandoMon.DataCase

  alias RandoMon.Account

  describe "users" do
    alias RandoMon.Account.User

    import RandoMon.AccountFixtures

    # @invalid_attrs %{is_active: nil, email: nil}
    @valid_attrs %{email: "some email", is_active: true, password: "some password"}
    @update_attrs %{
      email: "some updated email",
      is_active: false,
      password: "some updated password"
    }

    @invalid_attrs %{email: nil, is_active: nil, password: nil}

    def user_without_password(attrs \\ %{}) do
      IO.puts "it werk"
      %{user_fixture(attrs) | password: nil}
    end



    test "list_users/0 returns all users" do
      # user = user_fixture()
      user = user_without_password()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_without_password()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{" is_active": true, email: "some email"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user. is_active == true
      assert user.email == "some email"
      assert Bcrypt.verify_pass("some password", user.password_hash)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      # user = user_fixture()
      user = user_without_password()
      update_attrs = %{" is_active": false, email: "some updated email"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user. is_active == false
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
