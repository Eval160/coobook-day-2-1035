require_relative "view"
require_relative "scrapping_recipes_service"

class Controller
    def initialize(cookbook)
        @cookbook = cookbook
        @view = View.new
    end

    def list
        puts "TODO: List"
        # il demande à cookbook la liste de recettes et il la stock dans une variable
        recipes = @cookbook.all
        # il demande à view de l'afficher
        @view.display_list(recipes)
    end

    def add_recipe
        # il demande à view le nom de la recette et il la stock dans une variable
        name = @view.ask_for("Name")
        # il demande à view le description de la recette et il la stock dans une variable
        description = @view.ask_for("Description")
        rating = @view.ask_for("Rating")
        prep_time = @view.ask_for("Prep time")
        # il demande à Recipe de créer la recette
        recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
        # il demande à cookbook la recette
        @cookbook.add(recipe)
    end

    def remove_recipe
        # il demande à view l'index de la recette
        index = @view.ask_for_index
        # il demande à cookbook de supprimer la recette à cet index
        @cookbook.destroy_at(index)
    end

    def import
      # Demander l'ingredient à chercher à la view
      ingredient = @view.ask_for("Ingredient")
      # Scrapper l'url avec ce mot clé
      # on recupere un array d'instance de recipe et on les stock dans une variable recipes
      recipes = ScrappingRecipesService.new(ingredient).call
      # On affiche la list des recettes dans recipes
      @view.display_list(recipes)
      # On demande à la vue l'index de la recette à importer
      index = @view.ask_for_index
      recipe = recipes[index]
      # On ajoute la recette au cookbook
      @cookbook.add(recipe)
    end

    def mark_as_done
      # Afficher les recettes
      recipes = @cookbook.all
      @view.display_list(recipes)
      # Demander l'index de la recette à noter comme faite
      index = @view.ask_for_index
      # Demander au cookbook de marker la recette comme etant faite
      @cookbook.mark_recipe_as_done(index)
    end
end
