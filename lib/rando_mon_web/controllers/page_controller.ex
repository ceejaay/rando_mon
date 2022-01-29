defmodule RandoMonWeb.PageController do
  use RandoMonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
