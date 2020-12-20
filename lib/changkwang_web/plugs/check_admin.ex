defmodule ChangkwangWeb.Plugs.CheckAdmin do
  @behaviour Plug
  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]
  alias ChangkwangWeb.Router.Helpers, as: Routes

  def init(opts), do: opts

  def call(conn, _) do
    user_id =
      conn
      |> fetch_session()
      |> get_session(:user_id)

    if user_id do
      conn
    else
      redirect(conn, to: Routes.login_path(conn, :index))
    end

    conn
  end
end
