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

    private

    def load_csv
        CSV.foreach(@filepath) do |row|
            name = row[0]
            description = row[1]
            @recipes << Recipe.new(name, description)
        end
    end

    def save_csv
        CSV.open(@filepath, "wb") do |csv|
            @recipes.each do |recipe|
                csv << [recipe.name, recipe.description]
            end
        end
    end
end