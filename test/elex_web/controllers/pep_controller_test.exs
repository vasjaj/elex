defmodule ElexWeb.PepControllerTest do
  use ElexWeb.ConnCase

  test "GET /pep/search", %{conn: conn} do
    name = "some_name"
    conn = get(conn, "/pep/search?name=some_name")

    assert html_response(conn, 200) =~ "name1"
    assert html_response(conn, 200) =~ "name2"
    assert html_response(conn, 200) =~ "name3"
  end
end
