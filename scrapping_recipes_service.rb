require "nokogiri"
require "open-uri"
require_relative 'recipe'

class ScrappingRecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.allrecipes.com/search?q=#{@keyword}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")
    elements = doc.search(".mntl-card-list-items[href^='https://www.allrecipes.com/recipe/']")
    # Version avec le .each
    # recipes = []
    # elements.first(5).each do |element|
    #   name = element.search(".card__content").first['data-tag']
    #   url = element["href"]
    #   recipe_doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")
    #   description = recipe_doc.search("#article-subheading_1-0").text.strip
    #   rating = recipe_doc.search(".mntl-recipe-review-bar__rating").first.text.strip
    #   # J'itère sur tous les éléments ayant la class .mntl-recipe-detail__item
    #   # et je retourne l'élément donc le texte contient les caractères "total time"
    #   prep_time_element = recipe_doc.search(".mntl-recipe-details__item").find do |el|
    #     el.text.strip.match?(/total time/i)
    #   end
    #   prep_time = prep_time_element.search(".mntl-recipe-details__value").first.text.strip
    #   recipes << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    # end
    # return recipes

    # Version avec le .map
    recipes = elements.first(5).map do |element|
      name = element.search(".card__content").first['data-tag']
      url = element["href"]
      recipe_doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")
      description = recipe_doc.search("#article-subheading_1-0").text.strip
      rating = recipe_doc.search(".mntl-recipe-review-bar__rating").first.text.strip
      # J'itère sur tous les éléments ayant la class .mntl-recipe-detail__item
      # et je retourne l'élément donc le texte contient les caractères "total time"
      prep_time_element = recipe_doc.search(".mntl-recipe-details__item").find do |el|
        el.text.strip.match?(/total time/i)
      end
      prep_time = prep_time_element.search(".mntl-recipe-details__value").first.text.strip
      Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end
    return recipes
  end
end
