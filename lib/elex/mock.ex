defmodule Elex.Mock do
  @moduledoc """
  For testing purposes
  """

  @behaviour Elasticsearch.API

  @impl true
  def request(config, method, url, data, opts) do
    results = %{
      "hits" => %{
        "hits" => [
          %{
            "_source" => %{"name" => "name1"}
          },
          %{
            "_source" => %{"name" => "name2"}
          },
          %{
            "_source" => %{"name" => "name3"}
          }
        ]
      }
    }

    {:ok, results}
  end
end
