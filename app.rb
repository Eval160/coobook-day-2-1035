require_relative "cookbook.rb"
require_relative "recipe.rb"
require_relative "controller.rb"
require_relative "router.rb"


cookbook = Cookbook.new("recipes.csv")
recipe = Recipe.new("Glace vanille", "C'est super super bon!!!")

controller = Controller.new(cookbook)
router = Router.new(controller)

router.run