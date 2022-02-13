defmodule ChangkwangWeb.LoginController do
  use ChangkwangWeb, :controller
  alias Changkwang.Accounts

  def index(conn, _params) do
    render(conn, "login.html")
  end

  def login(conn, %{"email" => email, "password" => password} = _params) do
    if user = Accounts.get_user_by_email_and_password(email, password) do
      conn
      |> configure_session(renew: true)
      |> clear_session()
      |> put_session(:user_id, user.id)
      |> redirect(to: Routes.dashboard_path(conn, :index))
    end
  end
end
