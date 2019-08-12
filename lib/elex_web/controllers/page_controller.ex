defmodule ElexWeb.PageController do
  use ElexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
