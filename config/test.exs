use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elex, ElexWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :elex, Elex.ElasticsearchCluster,
  url: "http://localhost:9200",
  username: "username",
  password: "password",
  api: Elex.Mock,
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

# Configure your database
config :elex, Elex.Repo,
  username: "phoenix",
  password: "phoenix_password",
  database: "phoenix_db",
  hostname: "localhost",
  pool_size: 10,
  pool: Ecto.Adapters.SQL.Sandbox
