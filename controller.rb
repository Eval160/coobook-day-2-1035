require_relative "view"

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
        # il demande à Recipe de créer la recette
        recipe = Recipe.new(name, description)
        # il demande à cookbook la recette
        @cookbook.add(recipe)
    end

    def remove_recipe
        # il demande à view l'index de la recette
        index = @view.ask_for_index
        # il demande à cookbook de supprimer la recette à cet index
        @cookbook.destroy_at(index)
    end
    
end