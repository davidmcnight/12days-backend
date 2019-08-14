defmodule TwelveDaysApi.Users.User do
  use TwelveDaysApi.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :latest_activity, :naive_datetime
    timestamps()
  end

  # @spec changeset(User.t(), map) :: Ecto.Changeset.t()
  def changeset(user) do
    user
    |> validate_required([:email])
    |> update_change(:email, &String.downcase/1)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:password_digest, Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(%Ecto.Changeset{} = changeset), do: changeset




end
