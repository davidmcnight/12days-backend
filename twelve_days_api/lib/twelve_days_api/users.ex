defmodule TwelveDaysApi.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias TwelveDaysApi.Repo

  alias TwelveDaysApi.Users.User
  alias TwelveDaysApi.Events.Event

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  def list_user_events(%User{id: user_id} = user) do
    data = Map.from_struct(user)
    struct_list = Repo.all(from e in Event, where: e.creator_id == ^user_id)
    events = Enum.map(struct_list, fn struct -> Map.from_struct(struct) end)
    data = Map.put(data, :events, events)
    IO.inspect(data)
    data
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !! Repo.get(User, user_id)
  end


  def get_user_by_email!(email) do
    from(u in User, where: u.email == ^email)
    |> Repo.one()
  end

  def verify_password(%User{password_hash: password_hash} = user, password) do
    cond do
      Bcrypt.verify_pass(password, password_hash) -> {:ok, user}
      true -> {:error, :unauthorized}
    end
  end

  def authenticate_user(email, password) do
    user = get_user_by_email!(email)
    cond do
      user->verify_password(user, password)
      true->{:error, :not_found}
    end
#    with{:ok, %{User{} = user} }


  end


end
