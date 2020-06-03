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

    # @recipes.each do |recipe|
    #   recipe.ingredients.each do |ingredient|
    #     ingreds << ingredient.name
    #   end
    # ingreds
    # end


    # identify ingredients list for each recipe
    # identify names of each ingredient list in each recipe
    # shovel into array
    # identify unique instances for final return val
  end
end
