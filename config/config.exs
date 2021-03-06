# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elex,
  ecto_repos: [Elex.Repo]

# Configures the endpoint
config :elex, ElexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RGvFlpwRgRgni6zWHXrFvKGHvW5OkqGJovXkU4MlAvw/3mK5qMZURnrz0IH6PQRo",
  render_errors: [view: ElexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elex.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :elex, Elex.ElasticsearchCluster,
  url: "http://localhost:9200",
  username: "username",
  password: "password",
  api: Elasticsearch.API.HTTP,
  json_library: Jason,
  indexes: %{
    people: %{
      settings: "priv/elasticsearch/people.json",
      store: Elex.ElasticsearchStore,
      sources: [Elex.Person],
      bulk_page_size: 5000,
      bulk_wait_interval: 15_000 # 15 seconds
    }
  }
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
