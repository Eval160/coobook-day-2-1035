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

            print "> "
            action = gets.chomp.to_i

            case action
            when 0 then break
            when 1 then @controller.list
            when 2 then @controller.add_recipe
            when 3 then @controller.remove_recipe
            end
        end
    end

end