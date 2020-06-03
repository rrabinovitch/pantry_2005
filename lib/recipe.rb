class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    ingredients = []
    @ingredients_required.each do |ingred_name, _amount|
      ingredients << ingred_name
    end
    ingredients
    # refactor w reduce?
  end

  def total_calories
    total_cals = 0
    @ingredients_required.each do |ingredient, amount|
      total_cals += ingredient.calories * amount
    end
    total_cals
    # refactor w reduce?
  end
end
#
# # recipe1.ingredients_required:
# => {#<Ingredient:0x00007fa6450f94c8
#   @calories=100,
#   @name="Cheese",
#   @unit="C">=>2,
#  #<Ingredient:0x00007fa6450f9428
#   @calories=30,
#   @name="Macaroni",
#   @unit="oz">=>8}

# The total_calories method should sum the calories of each ingredient.

# The calories for each ingredient can be calculated by multiplying the
#  calories attribute of the Ingredient by the amount of the ingredient
#  required for the recipe.
