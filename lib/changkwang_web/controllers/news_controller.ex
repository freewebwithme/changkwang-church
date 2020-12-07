defmodule ChangkwangWeb.NewsController do
  use ChangkwangWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
