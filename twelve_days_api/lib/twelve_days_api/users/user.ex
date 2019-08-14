defmodule TwelveDaysApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :field, :string
    field :first_name, :string
    field :last_name, :string
    field :latest_activity, :naive_datetime
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:field, :email, :first_name, :last_name, :password_hash, :latest_activity])
    |> validate_required([:field, :email, :first_name, :last_name, :password_hash, :latest_activity])
  end
end
