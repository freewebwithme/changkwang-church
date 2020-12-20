defmodule Changkwang.Accounts do
  alias Changkwang.Accounts.User
  alias Changkwang.Repo

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert!()
  end

  def get_user(id) do
    Repo.get_by(User, id: id)
  end

  def get_user_by_email_and_password(email, password)
      when is_binary(email) and is_binary(password) do
    user = Repo.get_by(User, email: email)
    if User.valid_password?(user, password), do: user
  end
end
