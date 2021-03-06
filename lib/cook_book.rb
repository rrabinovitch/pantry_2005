class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingreds = []

    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        ingreds << ingredient.name
      end
    end

    ingreds.uniq
    # identify ingredients list for each recipe
    # identify names of each ingredient list in each recipe
    # shovel into array
    # identify unique instances for final return val

    # refactor out nesting
  end

  def highest_calorie_meal
    @recipes.max_by { |recipe| recipe.total_calories }
  end

  def date
    # return date of instantiation of the object
    # from googling this seems like an activerecord-related function...
  end

  def summary
    summary = {}
    @recipes.each do |recipe|
      summary[recipe.name] = {}
    end
    require "pry"; binding.pry
  end
end
