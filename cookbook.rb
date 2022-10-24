require "csv"

class Cookbook
    def initialize(filepath)
        @recipes = []
        @filepath = filepath
        load_csv
    end

    def all
        @recipes
    end

    def add(recipe)
        @recipes << recipe
        save_csv
    end

    def destroy_at(index)
        @recipes.delete_at(index)
        save_csv
    end

    def mark_recipe_as_done(index)
      recipe = @recipes[index]
      recipe.done!
      save_csv
    end

    private

    def load_csv
        CSV.foreach(@filepath) do |row|
            name = row[0]
            description = row[1]
            rating = row[2]
            prep_time = row[3]
            done = row[4] == "true"
            @recipes << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time, done: done)
        end
    end

    def save_csv
        CSV.open(@filepath, "wb") do |csv|
            @recipes.each do |recipe|
                csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done]
            end
        end
    end
end
