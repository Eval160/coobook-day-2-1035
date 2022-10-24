require "nokogiri"
require "open-uri"

file = "strawberry.html"

doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

elements = doc.search(".mntl-card-list-items[href^='https://www.allrecipes.com/recipe/']")
p elements.count

elements.first(5).each do |element|
  name = element.search(".card__content").first['data-tag']
  url = element["href"]
  recipe_doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")
  description = recipe_doc.search("#article-subheading_1-0").text.strip
end
