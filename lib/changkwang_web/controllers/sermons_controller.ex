defmodule ChangkwangWeb.SermonsController do
  use ChangkwangWeb, :controller
  alias Changkwang.Sermons

  def index(conn, _params) do
    sermons = Sermons.list_sermons()
    [latest] = Enum.take(sermons, 1)
    render(conn, "index.html", sermons: sermons, latest: latest)
  end
end
