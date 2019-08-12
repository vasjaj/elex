defmodule Elex.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :name, :string

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name])
  end
end

defimpl Elasticsearch.Document, for: Elex.Person do
  def id(person), do: person.id
  def routing(_), do: false
  def encode(person) do
    %{
      name: person.name,
    }
  end
end