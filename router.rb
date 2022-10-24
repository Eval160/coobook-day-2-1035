class Router
    def initialize(controller)
        @controller = controller
    end

    def run
        loop do
            puts "Your action?"
            puts "0 - Quit"
            puts "1 - List recipes"
            puts "2 - Add a recipe"
            puts "3 - Remove a recipe"
            puts "4 - Import recipes from the Internet"
            puts "5 - Mark a recipe as done"

            print "> "
            action = gets.chomp.to_i

            case action
            when 0 then break
            when 1 then @controller.list
            when 2 then @controller.add_recipe
            when 3 then @controller.remove_recipe
            when 4 then @controller.import
            when 5 then @controller.mark_as_done
            end
        end
    end

end
