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
    ### REVIEW REFACTOR
    @ingredients_required.keys

    ### CHALLENGE WORK
    # ingredients = []
    # @ingredients_required.each do |ingred_name, _amount|
    #   ingredients << ingred_name
    # end
    # ingredients


    # refactor w reduce?
    # ingred_name should prob be ingred w/o name
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
