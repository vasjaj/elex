{:ok, response} =
  HTTPoison.get(
    "https://www.cia.gov/library/publications/world-leaders-1/LG.html"
  )

html = response.body

elements = Floki.find(html, ".cos_name")

names =
  Enum.map(elements, fn element -> 
    {_, _, value}  = element
    {_, _, a} = List.first(value)

    List.first(a)
  end)

Enum.each(names, fn name -> 
  Elex.Repo.insert!(%Elex.Person{name: name})
end)