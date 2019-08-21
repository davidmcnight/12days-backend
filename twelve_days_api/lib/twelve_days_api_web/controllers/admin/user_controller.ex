defmodule TwelveDaysApiWeb.Admin.UserController do
  use TwelveDaysApiWeb, :controller

  alias TwelveDaysApi.Users
  alias TwelveDaysApi.Users.User


  def index(conn, _params) do
    case Users.admin_user?(conn) do
      :ok ->
        users = Users.list_users()
        render(conn, "index.html", users: users)
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Unauthorized")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def new(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_session(:admin, user.admin)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    case Users.admin_user?(conn) do
      :ok ->
        user = Users.get_user!(id)
        render(conn, "show.html", user: user)
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Unauthorized")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => id}) do
    case Users.admin_user?(conn) do
      :ok ->
        user = Users.get_user!(id)
        changeset = Users.change_user(user)
        render(conn, "edit.html", user: user, changeset: changeset)
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Unauthorized")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    case Users.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.admin_user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    {:ok, _user} = Users.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
