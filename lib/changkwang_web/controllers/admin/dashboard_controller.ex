defmodule ChangkwangWeb.Admin.DashboardController do
  use ChangkwangWeb, :controller

  def index(conn, _params) do
    IO.puts("Inspecting assigns")
    render(conn, "index.html")
  end
end
