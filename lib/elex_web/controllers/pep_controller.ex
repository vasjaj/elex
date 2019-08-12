defmodule ElexWeb.PepController do
  use ElexWeb, :controller
  
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def search(conn, %{"name" => name}) do
    {:ok, results} =
      Elasticsearch.
        post(
          Elex.ElasticsearchCluster,
          "/people/_search",
          %{"query" => %{"match" => %{"name" => name}}}
        )

    names = Enum.map(results["hits"]["hits"], fn value -> value["_source"]["name"] end)
    
    render(conn, "matches.html", matches: names)
  end
end
