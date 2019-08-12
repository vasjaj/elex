defmodule Elex.ElasticsearchCluster do
  use Elasticsearch.Cluster, otp_app: :elex
end