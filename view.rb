class View
    def display_list(recipes)
        recipes.each_with_index do |recipe, index|
           status = recipe.done? ? "[X]" : "[ ]"
            puts "#{index + 1} - #{status} #{recipe.name} : #{recipe.description} (#{recipe.rating} / 5) - #{recipe.prep_time}"
        end
    end

    def ask_for(string)
        puts "#{string} please?"
        print "> "
        gets.chomp
    end

    def ask_for_index
        puts "Index please?"
        print "> "
        gets.chomp.to_i - 1
    end
end
