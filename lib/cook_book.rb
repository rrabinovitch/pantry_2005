require 'date'

class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    @date = Date.today.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def unique_ingredients ### REVIEW REFACTOR
    @recipes.flat_map do |recipe|
      recipe.ingredients
    end.uniq
  end

  def ingredients
    ### REVIEW REFACTOR
    unique_ingredients.map do |ingredient|
      ingredient.name
    end

    ### CHALLENGE WORK
    # ingreds = []
    #
    # @recipes.each do |recipe|
    #   recipe.ingredients.each do |ingredient|
    #     ingreds << ingredient.name
    #   end
    # end
    #
    # ingreds.uniq


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
    ### REVIEW REFACTOR - in attributes

    ### CHALLENGE WORK
    # return date of instantiation of the object
    # from googling this seems like an activerecord-related function...
  end

  def summary
    summary = {}
    @recipes.each do |recipe|
      summary[recipe.name] = {}
    end
  end
end
