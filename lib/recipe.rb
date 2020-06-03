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

end
